namespace Doca.Widgets {

    public class Window : Gtk.ApplicationWindow {

        public Paned paned { get; set; }

        public Window (Gtk.Application app) {
            Object (
                application: app
            );
        }

        construct {
            Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;

            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/github/foss-io/doca/stylesheet.css");

            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );

            paned = new Paned (this);

            window_position = Gtk.WindowPosition.CENTER;
            set_default_size (987, 615);

            move (settings.pos_x, settings.pos_y);
            resize (settings.window_width, settings.window_height);

            delete_event.connect (e => {
                return before_destroy ();
            });

            var headerbar = new HeaderBar (this);
            set_titlebar (headerbar);

            add (paned);

            show_all ();
        }

        public bool before_destroy () {
            int width, height, x, y;

            get_size (out width, out height);
            get_position (out x, out y);

            settings.pos_x = x;
            settings.pos_y = y;
            settings.window_width = width;
            settings.window_height = height;

            return false;
        }

    }

}
