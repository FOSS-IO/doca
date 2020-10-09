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

        public new void verify_availability () throws ContainerError {
            if (!is_daemon_installed ()) {
                throw new ContainerError.DAEMON_NOT_INSTALLED ("Daemon not installed!");
            } else if (!is_daemon_enabled ()) {
                throw new ContainerError.DAEMON_NOT_ENABLED ("Daemon not enabled!");
            } else if (!is_daemon_active ()) {
                throw new ContainerError.DAEMON_NOT_ACTIVE ("Daemon not active!");
            } else if (!is_current_user_in_docker_group ()) {
                throw new ContainerError.CURRENT_USER_NOT_IN_DOCKER_GROUP ("Current user not in docker group!");
            }
        }

        public new bool is_daemon_installed () {
            return dockerEngineApi.is_daemon_installed ();
        }

        public new bool is_daemon_enabled () {
            return dockerEngineApi.is_daemon_enabled ();
        }

        public new bool is_daemon_active () {
            return dockerEngineApi.is_daemon_active ();
        }

        public new bool is_current_user_in_docker_group () {
            return dockerEngineApi.is_current_user_in_docker_group ();
        }

        public new void install_docker () {
            dockerEngineApi.install_docker ();
        }

        public new List<Container> list_all_containers () throws ContainerError {
            var containers = new List<Container> ();
            var images = list_all_images ();
            var processes = list_all_processes ();
            var stats = list_all_stats ();

            foreach (var image in images) {
                Entity.Process process_found = null;
                Stats stats_found = null;

                foreach (var process in processes) {
                    if (image.repository_tag == process.image_id) {
                        process_found = process;
                        break;
                    }
                }

                if (process_found != null) {
                    foreach (var _stats in stats) {
                        if (process_found.id == _stats.container_id) {
                            stats_found = _stats;
                            break;
                        }
                    }
                }

                containers.append (new Container (image, process_found, stats_found));
            }

            return containers;
        }

        public new List<Image> list_all_images () throws ContainerError {
            verify_availability ();

            return dockerEngineApi.list_all_images ();
        }

        public new List<Entity.Process> list_all_processes () throws ContainerError {
            verify_availability ();

            return dockerEngineApi.list_all_processes ();
        }

        public new List<Stats> list_all_stats () throws ContainerError {
            verify_availability ();

            return dockerEngineApi.list_all_stats ();
        }

        public new void start_image (string id) {
            dockerEngineApi.start_image (id);
        }

        public new void stop_image (string id) {
            dockerEngineApi.stop_image (id);
        }

    }

}
