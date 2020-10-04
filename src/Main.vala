public class Main {
    
    public static int main (string[] args) {
        IContainerService containerService = new ContainerService ();

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
