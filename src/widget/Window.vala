using Doca.Widget.Component;

namespace Doca.Widget {

    public class Window : Gtk.ApplicationWindow {

        public Gtk.CssProvider css_provider { get; private set; }
        public Paned paned { get; private set; }
        public HeaderBar header_bar { get; private set; }

        public Window (Gtk.Application app) {
            Object (
                application: app
            );

            var overlay = new Gtk.Overlay ();

            //  var overlaybar = new Granite.Widgets.OverlayBar (overlay);
            //  overlaybar.label = "Hover the OverlayBar to change its position";
            //  overlaybar.active = true;

            //  overlaybar.destroy ();

            css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/github/foss-io/doca/stylesheet.css");

            header_bar = new HeaderBar (this);
            margin = 16;

            //  paned = new Paned (this);
            var container_list = new ContainerListView (this);

            overlay.add (container_list);

            Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;
            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );

            this.window_position = Gtk.WindowPosition.CENTER;
            this.set_default_size (987, 615);
            this.move (settings.pos_x, settings.pos_y);
            this.resize (settings.window_width, settings.window_height);
            this.set_titlebar (header_bar);
            this.add (overlay);
            this.delete_event.connect (before_destroy);
            this.show_all ();
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
