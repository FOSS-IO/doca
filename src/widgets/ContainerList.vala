namespace Doca.Widgets {

    public class ContainerList : Gtk.Grid {
        public weak Window window { get; construct; }
        public Gtk.Grid titleGrid;
        public Gtk.Label titleText;

        public ContainerList ( Window main_window ) {
            Object (
                orientation: Gtk.Orientation.VERTICAL,
                window: main_window,
                width_request: 250,
                column_homogeneous: true
            );
        }

        construct {
            titleText = new Gtk.Label ("CONTAINERS");
            titleText.get_style_context ().add_class ("sidebar-title");
            titleText.halign = Gtk.Align.CENTER;
            titleText.hexpand = true;

            titleGrid = new Gtk.Grid ();
            titleGrid.add (titleText);

            attach (titleGrid, 0, 0);
        }
    }
}
