using Doca.Entity;
using Doca.Service;
using Doca.Service.Adapter;
using Doca.Service.Exception;
using Doca.Widget.Component;

namespace Doca.Widget {

    public class ContainerListView : Gtk.Grid {

        public weak Window window { get; construct; }
        public Gtk.Label title_label { get; private set; }
        public Gtk.Grid header_grid { get; private set; }
        public Gtk.SearchEntry search_bar { get; private set; }
        public Gtk.ScrolledWindow side_scrolled_window { get; private set; }
        public Button delete_all_btn { get; private set; }
        public Button home_btn { get; private set; }
        public Gtk.Grid toolbar { get; private set; }
        public Gtk.ListBox list_box { get; private set; }

        public IContainerService containerService { get; private set; }

        public ContainerListView (Window main_window) {
            Object (
                orientation: Gtk.Orientation.VERTICAL,
                window: main_window,
                width_request: 250,
                column_homogeneous: true
            );

            containerService = new ContainerService ();

            title_label = new Gtk.Label (_("Containers"));
            title_label.get_style_context ().add_class ("sidebar-title-text");
            title_label.halign = Gtk.Align.START;
            title_label.hexpand = true;

            header_grid = new Gtk.Grid ();

            var label1 = new Gtk.Label (_("Container Name"));
            label1.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);
            title_label.get_style_context ().add_class ("label1");

            var label2 = new Gtk.Label (_("Ports"));
            label2.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);
            title_label.get_style_context ().add_class ("label2");

            var label3 = new Gtk.Label (_("Status"));
            label3.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);
            title_label.get_style_context ().add_class ("label3");

            header_grid.attach(label1, 0,0,1,1);
            header_grid.attach(label2, 1,0,1,1);
            header_grid.attach(label3, 2,0,1,1);


            //  search_bar = new Gtk.SearchEntry ();
            //  search_bar.placeholder_text = _("Search");
            //  search_bar.get_style_context ().add_class ("search-entry");
            //  search_bar.hexpand = true;
            //  search_bar.search_changed.connect (() => {
            //      list_box.invalidate_filter ();
            //  });

            list_box = new Gtk.ListBox ();
            list_box.get_style_context ().add_class ("list-box");
            list_box.selection_mode = Gtk.SelectionMode.SINGLE;
            list_box.valign = Gtk.Align.FILL;
            list_box.expand = true;
            //  list_box.set_filter_func (on_search_container);
            list_box.set_activate_on_single_click (false);

            side_scrolled_window = new Gtk.ScrolledWindow (null, null);
            side_scrolled_window.hscrollbar_policy = Gtk.PolicyType.AUTOMATIC;
            side_scrolled_window.vscrollbar_policy = Gtk.PolicyType.AUTOMATIC;
            side_scrolled_window.expand = true;
            side_scrolled_window.add (list_box);

            //  delete_all_btn = new Button ("user-trash-symbolic", _("Delete All"), "");
            //  delete_all_btn.halign = Gtk.Align.END;
            //  delete_all_btn.hexpand = true;
            //  delete_all_btn.clicked.connect (() => {
            //      var message_dialog = new Granite.MessageDialog.with_image_from_icon_name (_("Are you sure you want to proceed?"), _("All the containers will be deleted and you won’t be able to recover it."), "dialog-warning", Gtk.ButtonsType.CANCEL);
            //      message_dialog.transient_for = this.window;

            //      var suggested_button = new Gtk.Button.with_label (_("Yes, Delete All!"));
            //      suggested_button.get_style_context ().add_class (Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);
            //      message_dialog.add_action_widget (suggested_button, Gtk.ResponseType.ACCEPT);

            //      message_dialog.show_all ();
            //      if (message_dialog.run () == Gtk.ResponseType.ACCEPT) {

            //      }

            //      message_dialog.destroy ();
            //  });

            //  home_btn = new Button ("go-home-symbolic", _("Home"), "");
            //  home_btn.clicked.connect (() => {});

            //  toolbar = new Gtk.Grid ();
            //  toolbar.get_style_context ().add_class ("list-box-toolbar");
            //  toolbar.attach (home_btn, 0, 0, 1, 1);
            //  toolbar.attach (delete_all_btn, 1, 0, 1, 1);

            list_box.row_selected.connect(() => {});

            this.get_style_context ().add_class ("sidebar");
            this.attach (title_label, 0, 0);
            this.attach(header_grid,0,1);
            this.attach (side_scrolled_window, 0, 2, 1, 1);
            //  this.attach (toolbar, 0, 4, 1, 2);

            this.reload ();

        }

        public void reload () {
            try {
                var containers = containerService.list_all_containers ();



                list_box.foreach ((element) => {
                    list_box.remove (element);
                });

                containers.foreach ((container) => {
                    var container_list_row = new ContainerListRow (container);
                    container_list_row.on_start_container.connect (containerService.start_image);
                    container_list_row.on_stop_container.connect (containerService.stop_image);
                    container_list_row.on_status_changed.connect (this.reload);
                    container_list_row.on_delete_container.connect (on_delete_container);

                    list_box.add (container_list_row);
                });

                list_box.show_all ();
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

                error (ex.message);
            }
        }

        public bool on_search_container (Gtk.ListBoxRow row) {
            var search_text = search_bar.get_text ().down ();

            if (search_text in ((ContainerListRow) row).container.process.names){
                return true;
            }
            return false;
        }

        public void on_selected_row (Gtk.ListBoxRow row) {

        }

        public void on_delete_container (string container_id) {
            var message_dialog = new Granite.MessageDialog.with_image_from_icon_name (_("Are you sure you want to delete it?"), _("All the containers will be deleted and you won’t be able to recover it."), "dialog-warning", Gtk.ButtonsType.CANCEL);
            message_dialog.transient_for = this.window;

            var suggested_button = new Gtk.Button.with_label (_("Yes, Delete All!"));
            suggested_button.get_style_context ().add_class (Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);
            message_dialog.add_action_widget (suggested_button, Gtk.ResponseType.ACCEPT);

            message_dialog.show_all ();
            if (message_dialog.run () == Gtk.ResponseType.ACCEPT) {
                print("\n %s", container_id);
            }

            message_dialog.destroy ();
        }

    }

}
