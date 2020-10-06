namespace Doca.Widgets {

    public class Paned : Gtk.Paned {
        public weak Window window { get; construct; }

        public Paned (Window main_window) {
            Object (
                orientation: Gtk.Orientation.HORIZONTAL,
                window: main_window
            );
        }

        construct {
            position = 260;

            var sidebar = new Gtk.Stack ();
            var label = new Gtk.Label ("teste");

            var main = new Gtk.Stack ();

            var welcome = new Doca.Widgets.Welcome (window);


            sidebar.add_named(label, "label");

            main.add_named(welcome, "welcome");

            pack1 (sidebar, false, false);
            pack2 (main, true, false);
        }
    }
}

