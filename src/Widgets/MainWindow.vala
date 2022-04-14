namespace Ruler {
    public class MainWindow : Gtk.ApplicationWindow {
        public MainWindow (Gtk.Application app) {
            Object(
                application: app
            );
        }

        construct {
            default_width = 200;
            default_height = 200;
            title = "Ruler";
        }
    }
}
