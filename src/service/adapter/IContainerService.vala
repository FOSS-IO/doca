using Doca.Entity;
using Doca.Service.Exception;

namespace Doca.Service.Adapter {

    public interface IContainerService : Object {

        public async abstract void verify_availability () throws ContainerError;
        public async abstract bool is_daemon_installed ();
        public async abstract bool is_daemon_enabled ();
        public async abstract bool is_daemon_active ();
        public async abstract bool is_current_user_in_docker_group ();
        public async abstract void install_docker ();
        public async abstract List<Container> list_all_containers () throws ContainerError;
        public async abstract List<Image> list_all_images () throws ContainerError;
        public async abstract List<Entity.Process> list_all_processes () throws ContainerError;
        public async abstract List<Stats> list_all_stats () throws ContainerError;
        public async abstract void start_image (string id);
        public async abstract void stop_image (string id);

    }

}
