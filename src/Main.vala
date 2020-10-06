public class Main {

    public static int main (string[] args) {
        IContainerService containerService = new ContainerService ();

        var is_installed = containerService.is_daemon_installed ();
        message ("============ IS INSTALLED ============");
        print (@"$is_installed\n");

        var is_enabled = containerService.is_daemon_enabled ();
        message ("============ IS ENABLED ============");
        print (@"$is_enabled\n");

        var is_active = containerService.is_daemon_active ();
        message ("============ IS ACTIVE ============");
        print (@"$is_active\n");

        var is_current_user_in_docker_group = containerService.is_current_user_in_docker_group ();
        message ("============ IS CURRENT USER IN DOCKER GROUP ============");
        print (@"$is_current_user_in_docker_group\n");

        var images = containerService.list_all_images ();
        message ("============ IMAGES ============");
        images.foreach ((entry) => {
            print (@"$entry\n");
        });

        var processes = containerService.list_all_processes ();
        message ("============ PROCESSES ============");
        processes.foreach ((entry) => {
            print (@"$entry\n");
        });

        var stats = containerService.list_all_stats ();
        message ("============ STATS ============");
        stats.foreach ((entry) => {
            print (@"$entry\n");
        });

        return 0;
    }

}
