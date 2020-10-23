using Doca.Entity;
using Doca.Service;
using Doca.Service.Adapter;

namespace Doca.Widget.Component {

    public class ContainerListRow : Gtk.ListBoxRow {

        public signal void on_start_container (string container_id);
        public signal void on_stop_container (string container_id);
        public signal void on_status_changed ();
        public signal void on_delete_container (string container_id);

        public Gtk.Label title_label { get; private set; }
        public Gtk.Label status_label { get; private set; }
        public Gtk.Label ports_label { get; private set; }
        public Button container_button { get; private set; }
        public Button terminal_button { get; private set; }
        public Gtk.ModelButton duplicate_button { get; private set; }
        public Gtk.ModelButton delete_button { get; private set; }
        public Gtk.Separator menu_separator { get; private set; }
        public Gtk.MenuButton menu_button { get; private set; }
        public Gtk.Grid menu_grid { get; private set; }
        public Gtk.Popover menu_popover { get; private set; }
        public Gtk.Grid main_grid { get; private set; }
        public Gtk.Grid status_indicator_grid { get; private set; }
        public Gtk.Spinner spinner { get; private set; }

        public Container container { get; private set; }

        public signal void reload ();

        public ContainerListRow (Container container) {
            this.container = container;

            status_indicator_grid = new Gtk.Grid ();
            status_indicator_grid.halign = Gtk.Align.CENTER;
            status_indicator_grid.get_style_context ().add_class ("status-indicator");
            status_indicator_grid.tooltip_markup = Granite.markup_accel_tooltip ({}, this.container.process.is_running ? "Running" : "Stopped");
            status_indicator_grid.get_style_context ().add_class (container.process.is_running ? "status-indicator-up" : "status-indicator-down");

            title_label = new Gtk.Label (container.process.names);
            title_label.get_style_context ().add_class ("list-box-row-label");
            title_label.halign = Gtk.Align.START;
            title_label.ellipsize = Pango.EllipsizeMode.END;
            title_label.margin_end = 9;
            title_label.hexpand = true;

            //  string ports = container.process.ports.split (":")[1].split ("/")[0].replace ("->",":");

            //  ports_label = new Gtk.Label (container.process.ports != "" ? ports : "");
            ports_label = new Gtk.Label (container.process.ports);
            ports_label.get_style_context ().add_class ("list-box-row-label");
            ports_label.get_style_context ().add_class ("list-box-row-label-info");
            ports_label.halign = Gtk.Align.START;



            status_label = new Gtk.Label (container.process.status.replace ("(0)", ""));
            status_label.get_style_context ().add_class ("list-box-row-label");
            status_label.get_style_context ().add_class ("list-box-row-label-info");
            status_label.halign = Gtk.Align.START;
            status_label.ellipsize = Pango.EllipsizeMode.END;




            spinner = new Gtk.Spinner ();
            spinner.get_style_context ().add_class ("spinner");

            container_button = new Button (
                container.process.is_running ? "media-playback-stop-symbolic" : "media-playback-start-symbolic",
                "Start/Stop",
                "btn-container"
            );

            terminal_button = new Button (
                "utilities-terminal",
                "See Logs",
                "btn-terminal"
            );


            container_button.clicked.connect (container_button_clicked);

            duplicate_button = new Gtk.ModelButton ();
            duplicate_button.text = _("Duplicate Container");

            delete_button = new Gtk.ModelButton ();
            delete_button.text = _("Delete Container");
            delete_button.clicked.connect (() => {
                on_delete_container(this.container.process.id);
            });

            menu_separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
            menu_separator.margin_top = 6;
            menu_separator.margin_bottom = 6;

            menu_button = new Gtk.MenuButton ();
            menu_button.get_style_context ().add_class ("btn-menu");
            menu_button.tooltip_text = _("Options");
            menu_button.set_image (
                new Gtk.Image.from_icon_name (
                    "view-more-symbolic",
                    Gtk.IconSize.SMALL_TOOLBAR
                )
            );

            menu_grid = new Gtk.Grid ();
            menu_grid.expand = true;
            menu_grid.margin_top = 3;
            menu_grid.margin_bottom = 3;
            menu_grid.orientation = Gtk.Orientation.VERTICAL;

            menu_grid.attach (duplicate_button, 0, 2, 1, 1);
            menu_grid.attach (menu_separator, 0, 3, 1, 1);
            menu_grid.attach (delete_button, 0, 4, 1, 1);
            menu_grid.show_all ();

            var menu_popover = new Gtk.Popover (null);
            menu_popover.add (menu_grid);

            menu_button.popover = menu_popover;
            menu_button.relief = Gtk.ReliefStyle.NONE;
            menu_button.valign = Gtk.Align.CENTER;

            main_grid = new Gtk.Grid ();
            main_grid.get_style_context ().add_class ("list-box-row-grid");
            main_grid.margin = 3;
            main_grid.attach (status_indicator_grid, 0, 0, 1, 1);
            main_grid.attach (title_label, 1, 0, 1, 1);
            main_grid.attach (ports_label, 2, 0, 1, 1);
            main_grid.attach (status_label, 3, 0, 1, 1);
            //  main_grid.attach (spinner, 2, 0, 1, 1);
            main_grid.attach (terminal_button, 4, 0, 1, 1);
            main_grid.attach (container_button, 5, 0, 1, 1);
            main_grid.attach (menu_button, 6, 0, 1, 1);

            this.get_style_context ().add_class ("list-box-row");
            this.expand = true;
            this.add (main_grid);
        }

        private void container_button_clicked () {
            container_button.sensitive = false;
            spinner.start ();

            var display_default = Gdk.Display.get_default ();
            //  this.get_parent_window ().set_cursor (new Gdk.Cursor.from_name (display_default, "wait"));

            var container_id = container.process.id;

            if (container.process.is_running) {
                on_stop_container (container_id);
            } else {
                on_start_container (container_id);
            }

            this.get_parent_window ().set_cursor (new Gdk.Cursor.from_name (display_default, "default"));

            on_status_changed ();
        }



    }

}
