namespace Doca.Widget.Component {

    public class Dialog : Granite.MessageDialog {
        public Gtk.Button suggested_button { get; set; }

        public Dialog (
            Gtk.ApplicationWindow window,
            string title,
            string description,
            Gtk.ButtonsType default_button = Gtk.ButtonsType.CLOSE,
            string icon = ""
            //  Gtk.Widget

        ) {
            this.transient_for = window;


                this.with_image_from_icon_name (
                    title,
                    description,
                    icon,
                    default_button
                );




            //  this.primary_text (title);
            //  this.secondary_text (description);

            //  var suggested_button = new Gtk.Button.with_label (_("Yes, Delete All!"));
            //  suggested_button.get_style_context ().add_class (Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);
            //  message_dialog.add_action_widget (suggested_button, Gtk.ResponseType.ACCEPT);


        }
    }
}
