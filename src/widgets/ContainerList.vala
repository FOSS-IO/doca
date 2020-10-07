namespace Doca.Widgets {

    public class ContainerList : Gtk.Grid {

        public weak Window window { get; construct; }
        public Gtk.Grid title_grid { get; set; }
        public Gtk.Label title_text { get; set; }
        public Gtk.ScrolledWindow scroll { get; set; }
        public Gtk.ListBox list_box { get; set; }

        public ContainerList ( Window main_window ) {
            Object (
                orientation: Gtk.Orientation.VERTICAL,
                window: main_window,
                width_request: 250,
                column_homogeneous: true
            );
        }

        construct {
            //TITLE
            this.get_style_context ().add_class ("sidebar");
            title_text = new Gtk.Label ("CONTAINERS");
            title_text.get_style_context ().add_class ("sidebar-title-text");
            title_text.halign = Gtk.Align.CENTER;
            title_text.hexpand = true;

            title_grid = new Gtk.Grid ();
            title_grid.get_style_context ().add_class ("sidebar-title");
            title_grid.add (title_text);

            attach (title_grid, 0, 0);

            //LIST
            scroll = new Gtk.ScrolledWindow (null, null);
            scroll.hscrollbar_policy = Gtk.PolicyType.AUTOMATIC;
            scroll.vscrollbar_policy = Gtk.PolicyType.AUTOMATIC;

            list_box = new Gtk.ListBox ();
            list_box.get_style_context ().add_class ("list-box");
            //  item_box.set_activate_on_single_click (false);
            list_box.selection_mode = Gtk.SelectionMode.SINGLE;
            list_box.valign = Gtk.Align.FILL;
            list_box.expand = true;

            scroll.add (list_box);
            scroll.expand = true;

            attach (scroll, 0, 1, 1, 2);
<<<<<<< HEAD

            var processes = containerService.list_all_processes ();
            processes.foreach ((entry) => {
                var teste = new Doca.Widgets.Components.ContainerListRow (entry.names);
                list_box.add (teste);
            });


=======
>>>>>>> 5391466a22e2b444f24af44cfb6ad074d581f0ab
        }

    }

}
