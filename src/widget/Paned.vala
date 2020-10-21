namespace Doca.Widget {

    public class Paned : Gtk.Paned {

        public weak Window window { get; construct; }
        public Welcome welcome { get; private set; }
        public ContainerListView container_list { get; private set; }
        public Gtk.Stack sidebar_stack { get; private set; }
        public Gtk.Stack main_stack { get; private set; }
        public Gtk.Grid main_grid { get; private set; }

        public Paned (Window main_window) {
            Object (
                orientation: Gtk.Orientation.HORIZONTAL,
                window: main_window
            );

            container_list = new ContainerListView (window);

            welcome = new Welcome (window);

            main_grid = new Gtk.Grid ();
            main_grid.orientation = Gtk.Orientation.VERTICAL;
            main_grid.attach (welcome, 0, 1);

            sidebar_stack = new Gtk.Stack ();
            sidebar_stack.add_named(container_list, "list");

            main_stack = new Gtk.Stack ();
            main_stack.add_named(main_grid, "welcome");

            this.position = 260;
            this.pack1 (sidebar_stack, false, false);
            this.pack2 (main_stack, true, false);
        }

    }

}
