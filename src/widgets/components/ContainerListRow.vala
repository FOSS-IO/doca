using Doca.Entity;

namespace Doca.Widgets.Components {

    public class ContainerListRow : Gtk.ListBoxRow {
        public Doca.Entity.Image image;
        public Gtk.Label title { get; set; }

        public ContainerListRow (Doca.Entity.Image img) {
            this.image = img;
            get_style_context ().add_class ("list-box-row");
            expand = true;

            var grid = new Gtk.Grid ();
            grid.get_style_context ().add_class ("list-box-row-grid");
            grid.margin = 3;

            var status_indicator = new Gtk.Grid ();
            status_indicator.halign = Gtk.Align.CENTER;
            status_indicator.get_style_context ().add_class ("status-indicator");
            //  status_indicator.set_size_request (20, 12);
            //  status_indicator.margin = 15;


            title = new Gtk.Label (image.repository);
            title.get_style_context ().add_class ("list-box-row-label");
            title.halign = Gtk.Align.START;
            title.ellipsize = Pango.EllipsizeMode.END;
            title.margin_end = 9;
            title.set_line_wrap (true);
            title.hexpand = true;

            grid.attach (status_indicator, 0, 0, 1, 1);
            grid.attach (title, 1, 0, 1, 1);

            add (grid);
        }

    }

}
