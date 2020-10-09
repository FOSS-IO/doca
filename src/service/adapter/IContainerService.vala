using Doca.Entity;
using Doca.Service.Exception;

namespace Doca.Service.Adapter {

    public interface IContainerService : Object {

        public abstract void verify_availability () throws ContainerError;
        public abstract bool is_daemon_installed ();
        public abstract bool is_daemon_enabled ();
        public abstract bool is_daemon_active ();
        public abstract bool is_current_user_in_docker_group ();
        public abstract void install_docker ();
        public abstract List<Container> list_all_containers () throws ContainerError;
        public abstract List<Image> list_all_images () throws ContainerError;
        public abstract List<Entity.Process> list_all_processes () throws ContainerError;
        public abstract List<Stats> list_all_stats () throws ContainerError;
        public abstract void start_image (string id);
        public abstract void stop_image (string id);

    }

}
