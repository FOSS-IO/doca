namespace Doca.Widgets {

    public class HeaderBar : Gtk.HeaderBar {

        public Window main_window { get; construct; }
        private Granite.ModeSwitch mode_switch { get; set; }

        public HeaderBar (Window window) {
            Object (
                main_window: window
            );
        }

        construct {
            this.get_style_context ().add_class ("headerbar");
            title = PROJECT_NAME;
            show_close_button = true;

            mode_switch = new Granite.ModeSwitch.from_icon_name ("display-brightness-symbolic", "weather-clear-night-symbolic");
            mode_switch.primary_icon_tooltip_text = "Light background";
            mode_switch.secondary_icon_tooltip_text = "Dark background";
            mode_switch.valign = Gtk.Align.CENTER;
            mode_switch.bind_property ("active", settings, "dark-theme");
            mode_switch.notify.connect (() => {
                Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;
            });

            if (settings.dark_theme) {
                mode_switch.active = true;
            }

            var menu_button = new Gtk.Button.from_icon_name ("open-menu",
                Gtk.IconSize.LARGE_TOOLBAR);
            menu_button.valign = Gtk.Align.CENTER;


            pack_end (menu_button);

            pack_end (mode_switch);
        }

    }

}
