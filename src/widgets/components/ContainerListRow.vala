using Doca.Entity;
using Doca.Service;
using Doca.Service.Adapter;

namespace Doca.Widgets.Components {

    public class ContainerListRow : Gtk.ListBoxRow {

        public signal void on_start_container (string container_id);
        public signal void on_stop_container (string container_id);
        public signal void on_status_changed ();

        public Gtk.Label title_label { get; private set; }
        public Gtk.Button container_button { get; private set; }
        public Gtk.Grid main_grid { get; private set; }
        public Gtk.Grid status_indicator_grid { get; private set; }

        public Container container { get; private set; }

        public signal void reload ();

        public ContainerListRow (Container container) {
            this.container = container;

            status_indicator_grid = new Gtk.Grid ();
            status_indicator_grid.halign = Gtk.Align.CENTER;
            status_indicator_grid.get_style_context ().add_class ("status-indicator");
            status_indicator_grid.get_style_context ().add_class (container.process.is_running ? "status-indicator-up" : "status-indicator-down");
            //  status_indicator_grid.set_size_request (20, 12);
            //  status_indicator_grid.margin = 15;

            title_label = new Gtk.Label (container.process.names);
            title_label.get_style_context ().add_class ("list-box-row-label");
            title_label.halign = Gtk.Align.START;
            title_label.ellipsize = Pango.EllipsizeMode.END;
            title_label.margin_end = 9;
            title_label.set_line_wrap (true);
            title_label.hexpand = true;

            container_button = new Gtk.Button.from_icon_name (container.process.is_running ? "media-playback-stop" : "media-playback-start", Gtk.IconSize.BUTTON);
            container_button.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            container_button.get_style_context ().add_class ("btn-container");
            container_button.tooltip_markup = Granite.markup_accel_tooltip ({"<Ctrl><Enter>"}, "Start/Stop");
            container_button.clicked.connect (container_button_clicked);

            main_grid = new Gtk.Grid ();
            main_grid.get_style_context ().add_class ("list-box-row-grid");
            main_grid.margin = 3;
            main_grid.attach (status_indicator_grid, 0, 0, 1, 1);
            main_grid.attach (title_label, 1, 0, 1, 1);
            main_grid.attach (container_button, 2, 0, 1, 1);

            this.get_style_context ().add_class ("list-box-row");
            this.expand = true;
            this.add (main_grid);
        }

        private void container_button_clicked () {
            var display_default = Gdk.Display.get_default ();
            this.get_parent_window ().set_cursor (new Gdk.Cursor.from_name (display_default, "wait"));

            var container_id = container.process.id;

            if (container.process.is_running) {
                on_start_container (container_id);
            } else {
                on_start_container (container_id);
            }

            this.get_parent_window ().set_cursor (new Gdk.Cursor.from_name (display_default, "default"));

            on_status_changed ();
        }

    }

}
