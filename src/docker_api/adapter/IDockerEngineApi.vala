using Doca.Entity;

namespace Doca.DockerApi.Adapter {

    public interface IDockerEngineApi : Object {

        public async abstract bool is_daemon_installed ();
        public async abstract bool is_daemon_enabled ();
        public async abstract bool is_daemon_active ();
        public async abstract bool is_current_user_in_docker_group ();
        public async abstract void install_docker ();
        public async abstract List<Image> list_all_images ();
        public async abstract List<Entity.Process> list_all_processes ();
        public async abstract List<Stats> list_all_stats ();
        public async abstract void start_image (string id);
        public async abstract void stop_image (string id);

    }

}
