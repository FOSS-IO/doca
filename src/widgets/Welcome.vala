namespace Doca.Widgets {

    public class Welcome : Granite.Widgets.Welcome {
        public unowned Window window { get; construct; }

        public Welcome (Window main_window) {
            Object (
                window: main_window,
                title: "Welcome to Doca",
                subtitle: "Managing containers has never been easier!"
            );
        }

        construct {
            valign = Gtk.Align.FILL;
            halign = Gtk.Align.FILL;
            vexpand = true;

            append ("bookmark-new", "Add a New Container", "Create a new container from the DockerHub");
            append ("document-import", "Import a Dockerfile", "Import a Dockerfile that you already have");
        }
    }
}
