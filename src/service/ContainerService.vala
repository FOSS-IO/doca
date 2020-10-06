using Doca.Entity;
using Doca.DockerApi;
using Doca.DockerApi.Adapter;
using Doca.Service.Adapter;

namespace Doca.Service {

    public class ContainerService : Object, IContainerService {

        public IDockerEngineApi dockerEngineApi { get; private set; }

        construct {
            dockerEngineApi = new DockerEngineApi ();
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

        public new List<Container> list_all_containers () {
            return new List<Container> ();
        }

        public new List<Image> list_all_images () {
            return dockerEngineApi.list_all_images ();
        }

        public new List<Entity.Process> list_all_processes () {
            return dockerEngineApi.list_all_processes ();
        }

        public new List<Stats> list_all_stats () {
            return dockerEngineApi.list_all_stats ();
        }

    }

}
