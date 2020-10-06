namespace Doca.Widgets {

    public class Paned : Gtk.Paned {
        public weak Window window { get; construct; }
        public Welcome welcome;
        public ContainerList list;

        public Paned (Window main_window) {
            Object (
                orientation: Gtk.Orientation.HORIZONTAL,
                window: main_window
            );
        }

        construct {
            position = 260;

            //SIDEBAR
            var sidebar = new Gtk.Stack ();
            list = new ContainerList (window);
            sidebar.add_named(list, "list");
            pack1 (sidebar, false, false);

            //MAIN
            var main = new Gtk.Stack ();
            welcome = new Welcome (window);
            main.add_named(welcome, "welcome");
            pack2 (main, true, false);
        }
    }
}

