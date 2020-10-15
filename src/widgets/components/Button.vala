namespace Doca.Widgets.Components {

    public class Button : Gtk.Button {
        public Button (string icon, string tooltip, string css_class) {
            Gtk.Image image = new Gtk.Image.from_icon_name(icon, Gtk.IconSize.BUTTON);

            image.margin = 3;

            this.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            this.get_style_context ().add_class (css_class);

            this.set_tooltip_text (tooltip);

            this.add (image);
        }
    }
}
