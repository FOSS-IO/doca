using Doca.Entity;
using Doca.DockerApi;
using Doca.DockerApi.Adapter;
using Doca.Service.Adapter;
using Doca.Service.Exception;

namespace Doca.Service {

    public class ContainerService : Object, IContainerService {

        private IDockerEngineApi dockerEngineApi { get; set; }

        construct {
            dockerEngineApi = new DockerEngineApi ();
        }

        public async new void verify_availability () throws ContainerError {
            if (!yield is_daemon_installed ()) {
                throw new ContainerError.DAEMON_NOT_INSTALLED ("Daemon not installed!");
            } else if (!yield is_daemon_enabled ()) {
                throw new ContainerError.DAEMON_NOT_ENABLED ("Daemon not enabled!");
            } else if (!yield is_daemon_active ()) {
                throw new ContainerError.DAEMON_NOT_ACTIVE ("Daemon not active!");
            } else if (!yield is_current_user_in_docker_group ()) {
                throw new ContainerError.CURRENT_USER_NOT_IN_DOCKER_GROUP ("Current user not in docker group!");
            }
        }

        public async new bool is_daemon_installed () {
            return yield dockerEngineApi.is_daemon_installed ();
        }

        public async new bool is_daemon_enabled () {
            return yield dockerEngineApi.is_daemon_enabled ();
        }

        public async new bool is_daemon_active () {
            return yield dockerEngineApi.is_daemon_active ();
        }

        public async new bool is_current_user_in_docker_group () {
            return yield dockerEngineApi.is_current_user_in_docker_group ();
        }

        public async new void install_docker () {
            yield dockerEngineApi.install_docker ();
        }

        public async new List<Container> list_all_containers () throws ContainerError {
            var containers = new List<Container> ();
            var images = yield list_all_images ();
            var processes = yield list_all_processes ();
            var stats = yield list_all_stats ();

            foreach (var image in images) {
                Entity.Process process_found = null;
                Stats stats_found = null;

                foreach (var process in processes) {
                    if (image.repository == process.image_id.substring (0, process.image_id.index_of (":"))) {
                        process_found = process;
                        break;
                    }
                }

                foreach (var _stats in stats) {
                    if (process_found.id == _stats.container_id) {
                        stats_found = _stats;
                        break;
                    }
                }

                containers.append (new Container (image, process_found, stats_found));
            }

            return containers;
        }

        public async new List<Image> list_all_images () throws ContainerError {
            yield verify_availability ();

            return yield dockerEngineApi.list_all_images ();
        }

        public async new List<Entity.Process> list_all_processes () throws ContainerError {
            yield verify_availability ();

            return yield dockerEngineApi.list_all_processes ();
        }

        public async new List<Stats> list_all_stats () throws ContainerError {
            yield verify_availability ();

            return yield dockerEngineApi.list_all_stats ();
        }

        public async new void start_image (string id) {
            yield dockerEngineApi.start_image (id);
        }

        public async new void stop_image (string id) {
            yield dockerEngineApi.stop_image (id);
        }

    }

}
