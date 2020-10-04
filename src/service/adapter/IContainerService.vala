public interface IContainerService : Object {

    public abstract List<Image> list_all_images ();
    public abstract List<Process> list_all_processes ();
    public abstract List<Stats> list_all_stats ();

}
