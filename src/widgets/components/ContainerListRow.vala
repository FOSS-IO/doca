using Doca.Entity;

namespace Doca.Widgets.Components {

    public class ContainerListRow : Gtk.ListBoxRow {
        public Doca.Entity.Container container;
        public Gtk.Label title { get; set; }
        public Gtk.Button btn_container;

        public ContainerListRow (Doca.Entity.Container container ) {
            this.container = container;
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

            print("LISTAGEM= %s", container.to_string ());
            title = new Gtk.Label (container.process.names);
            title.get_style_context ().add_class ("list-box-row-label");
            title.halign = Gtk.Align.START;
            title.ellipsize = Pango.EllipsizeMode.END;
            title.margin_end = 9;
            title.set_line_wrap (true);
            title.hexpand = true;

            btn_container = new Gtk.Button.from_icon_name ("media-playback-start", Gtk.IconSize.BUTTON);
            btn_container.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            btn_container.tooltip_markup = Granite.markup_accel_tooltip ({"<Ctrl><Return>"}, "Start/Stop");

            var a = new Gtk.Button.from_icon_name ("media-playback-start", Gtk.IconSize.BUTTON);
            a.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            a.tooltip_markup = Granite.markup_accel_tooltip ({"<Ctrl><Return>"}, "Start/Stop");

            grid.attach (status_indicator, 0, 0, 1, 1);
            grid.attach (title, 1, 0, 1, 1);
            grid.attach (btn_container, 2,0,1,1);
            grid.attach (a, 3,0,1,1);
            add (grid);
        }

    }

}
