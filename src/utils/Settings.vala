namespace Doca.Utils {

    public class Settings : GLib.Settings {

        public Settings () {
            Object (schema_id: PROJECT_ID);
        }

        public int pos_x {
            get { return get_int ("pos-x"); }
            set { set_int ("pos-x", value); }
        }

        public int pos_y {
            get { return get_int ("pos-y"); }
            set { set_int ("pos-y", value); }
        }

        public int window_width {
            get { return get_int ("window-width"); }
            set { set_int ("window-width", value); }
        }

        public int window_height {
            get { return get_int ("window-height"); }
            set { set_int ("window-height", value); }
        }

        public bool dark_theme {
            get { return get_boolean ("dark-theme"); }
            set { set_boolean ("dark-theme", value); }
        }

    }

}
