namespace Doca.Widget.Component {

    public class HeaderBar : Gtk.HeaderBar {

        public Window main_window { get; construct; }
        public Granite.ModeSwitch mode_switch { get; private set; }
        public Gtk.Button options_button { get; private set; }

        public HeaderBar (Window window) {
            Object (
                main_window: window
            );
        }

        construct {
            mode_switch = new Granite.ModeSwitch.from_icon_name ("display-brightness-symbolic", "weather-clear-night-symbolic");
            mode_switch.primary_icon_tooltip_text = "Light background";
            mode_switch.secondary_icon_tooltip_text = "Dark background";
            mode_switch.valign = Gtk.Align.CENTER;
            mode_switch.bind_property ("active", settings, "dark-theme");
            mode_switch.notify.connect (mode_switch_notify);
            mode_switch.active = settings.dark_theme;

            options_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
            options_button.valign = Gtk.Align.CENTER;

            this.title = PROJECT_NAME;
            this.show_close_button = true;
            this.get_style_context ().add_class ("headerbar");
            this.pack_end (options_button);
            this.pack_end (mode_switch);
        }

        private void mode_switch_notify () {
            Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;
        }

    }

}
