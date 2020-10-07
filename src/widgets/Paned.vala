namespace Doca.Widgets {

    public class Paned : Gtk.Paned {

        public weak Window window { get; construct; }
        public Welcome welcome { get; set; }
        public ContainerList list { get; set; }

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

            var grid = new Gtk.Grid ();
            grid.orientation = Gtk.Orientation.VERTICAL;

            //  var image = new Gtk.Image.from_icon_name ("address-book-new", Gtk.IconSize.BUTTON);
            //  grid.attach (image, 0, 0);
            grid.attach (welcome, 0, 1);

            main.add_named(grid, "welcome");
            pack2 (main, true, false);
        }

    }

}
