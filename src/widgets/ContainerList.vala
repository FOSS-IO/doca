using Doca.Entity;
using Doca.Service;
using Doca.Service.Adapter;
using Doca.Service.Exception;
using Doca.Widgets.Components;

namespace Doca.Widgets {

    public class ContainerList : Gtk.Grid {

        public weak Window window { get; construct; }
        public Gtk.Label title_label { get; private set; }
        public Gtk.Grid title_grid { get; private set; }
        public Gtk.ScrolledWindow side_scrolled_window { get; private set; }
        public Gtk.ListBox list_box { get; private set; }

        public IContainerService containerService { get; private set; }

        public ContainerList (Window main_window) {
            Object (
                orientation: Gtk.Orientation.VERTICAL,
                window: main_window,
                width_request: 250,
                column_homogeneous: true
            );

            containerService = new ContainerService ();

            title_label = new Gtk.Label (_("CONTAINERS"));
            title_label.get_style_context ().add_class ("sidebar-title-text");
            title_label.halign = Gtk.Align.CENTER;
            title_label.hexpand = true;

            title_grid = new Gtk.Grid ();
            title_grid.get_style_context ().add_class ("sidebar-title");
            title_grid.add (title_label);

            list_box = new Gtk.ListBox ();
            list_box.get_style_context ().add_class ("list-box");
            list_box.selection_mode = Gtk.SelectionMode.SINGLE;
            list_box.valign = Gtk.Align.FILL;
            list_box.expand = true;
            //  item_box.set_activate_on_single_click (false);

            side_scrolled_window = new Gtk.ScrolledWindow (null, null);
            side_scrolled_window.hscrollbar_policy = Gtk.PolicyType.AUTOMATIC;
            side_scrolled_window.vscrollbar_policy = Gtk.PolicyType.AUTOMATIC;
            side_scrolled_window.expand = true;
            side_scrolled_window.add (list_box);

            this.get_style_context ().add_class ("sidebar");
            this.attach (title_label, 0, 0);
            this.attach (side_scrolled_window, 0, 1, 1, 2);
            this.reload ();
        }

        public void reload () {
            try {
                var containers = containerService.list_all_containers ();

                containers.foreach ((container) => {
                    var container_list_row = new ContainerListRow (container);
                    container_list_row.on_start_container = containerService.start_image;
                    container_list_row.on_stop_container = containerService.stop_image;
                    container_list_row.on_status_changed = this.reload;

                    list_box.add (container_list_row);
                });
            } catch (ContainerError ex) {
                if (ex is ContainerError.DAEMON_NOT_INSTALLED) {
                    // DAEMON_NOT_INSTALLED
                } else if (ex is ContainerError.DAEMON_NOT_ENABLED) {
                    // DAEMON_NOT_ENABLED
                } else if (ex is ContainerError.DAEMON_NOT_ACTIVE) {
                    // DAEMON_NOT_ACTIVE
                } else if (ex is ContainerError.CURRENT_USER_NOT_IN_DOCKER_GROUP) {
                    // CURRENT_USER_NOT_IN_DOCKER_GROUP
                }
            }
        }

    }

}
