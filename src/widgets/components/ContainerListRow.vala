namespace Doca.Widgets.Components {

    public class ContainerListRow : Gtk.ListBoxRow {

        public Gtk.Label title { get; set; }
        public string data;

        public ContainerListRow (string a) {
            this.data = a;

            get_style_context ().add_class ("list-box-row");
            expand = true;

            title = new Gtk.Label (data);
            title.get_style_context ().add_class ("list-box-row-label");
            title.halign = Gtk.Align.START;
            title.ellipsize = Pango.EllipsizeMode.END;
            title.margin_end = 9;
            title.set_line_wrap (true);
            title.hexpand = true;

            add (title);
        }


    }

}
