namespace Doca.Widgets {

    public class Welcome : Granite.Widgets.Welcome {

        public unowned Window window { get; construct; }

        public Welcome (Window main_window) {
            Object (
                window: main_window,
                title: _("Welcome to Doca"),
                subtitle: _("Managing containers has never been easier!")
            );
        }

        construct {
            valign = Gtk.Align.FILL;
            halign = Gtk.Align.FILL;
            vexpand = true;

            append ("bookmark-new", _("Add a New Container"), _("Create a new container from the DockerHub"));
            append ("document-import", _("Import a Dockerfile"), _("Import a Dockerfile that you already have"));
        }

    }

}
