namespace Ruler {
    public class MainWindow : Gtk.ApplicationWindow {
        public MainWindow (Gtk.Application app) {
            Object (
                application: app
            );
        }

        construct {
            default_width = 200;
            default_height = 200;
            title = "Ruler";

            var layout_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10) {
                margin = 10,
            };

            var measure_button = create_measure_button ();
            var tolerance_selector = create_tolerance_selector ();
            var color_selector = create_color_selector ();
            var horizontal_ruler_toggle = new Granite.SwitchModelButton ("Horizontal ruler");
            var vertical_ruler_toggle = new Granite.SwitchModelButton ("Vertical ruler");

            layout_box.pack_start (horizontal_ruler_toggle, false, false, 0);
            layout_box.pack_start (vertical_ruler_toggle, false, false, 0);
            layout_box.pack_start (color_selector, false, false, 0);
            layout_box.pack_start (tolerance_selector, false, false, 0);
            layout_box.pack_start (measure_button, false, false, 0);
            add (layout_box);
        }

        private Gtk.Button create_measure_button () {
            var measure_button = new Gtk.Button.with_label ("Measure");
            measure_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
            return measure_button;
        }

        private Gtk.Box create_tolerance_selector () {
            var tolerance_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            var tolerance_label = new Gtk.Label ("Tolerance");
            var tolerance_adjustment = new Gtk.Adjustment (
                50, 0, 100, 50, 50, 0
            );

            var tolerance_scale = new Gtk.Scale (
                Gtk.Orientation.HORIZONTAL,
                tolerance_adjustment
            ) {
                draw_value = false,
            };

            tolerance_box.pack_start (tolerance_label);
            tolerance_box.pack_end (tolerance_scale);
            return tolerance_box;
        }

        private Gtk.Box create_color_selector () {
            var default_color = Gdk.RGBA () {
                red = 1,
                green = 0,
                blue = 0,
                alpha = 1
            };

            var color_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            var color_button = new Gtk.ColorButton.with_rgba (default_color);
            var color_button_label = new Gtk.Label ("Ruler color");
            color_button.title = "Ruler color";
            color_box.pack_start (color_button_label, true, false, 0);
            color_box.pack_start (color_button);
            return color_box;
        }
    }
}
