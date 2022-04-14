namespace Ruler {
    public class Application : Gtk.Application {
        public Application () {
             Object (
                application_id : "com.github.phoneybadger.ruler",
                flags : ApplicationFlags.FLAGS_NONE
            );           
        }

        public override void activate() {
            var main_window = new Ruler.MainWindow (this);
            main_window.show_all ();
        }
    }
}

