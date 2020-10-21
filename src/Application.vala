using Doca.Widget;

namespace Doca {

    public const string PROJECT_ID = "com.github.foss-io.doca";
    public const string PROJECT_NAME = "Doca";
    public Util.Settings settings;

    public class Application : Gtk.Application {

        construct {
            settings = new Util.Settings ();
        }

        public Application () {
            Object (
                application_id: PROJECT_ID,
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {
            var window = new Window (this);

            this.add_window (window);
        }

    }

}
