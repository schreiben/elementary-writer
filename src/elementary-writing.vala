

public class AppWindow : Gtk.Window {

		construct { //This is the default constructor for the new window.

			this.title = "My Application"; // Define the window title
			this.set_default_size(800, 800); // Define the intial size of the window.
			this.destroy.connect(Gtk.main_quit); // Clicking the close button will fully terminate the program.
			this.set_position(Gtk.WindowPosition.CENTER); // Launch the program in the center of the screen
			this.set_titlebar(this.header());

			var scrolled = new Gtk.ScrolledWindow(null, null);

			var text_view = new Gtk.TextView();


			// Font
			var font_description = new Pango.FontDescription();
      font_description.set_family("Libre Baskerville");
      font_description.set_size((int)(14 * Pango.SCALE));
			text_view.override_font(font_description);

			// Wrapping
			text_view.wrap_mode = Gtk.WrapMode.WORD;

			// Line spacing
			text_view.pixels_inside_wrap = 4;
			text_view.pixels_above_lines = text_view.pixels_below_lines = 2;

			// Paragraph indent
			text_view.indent = 40;

			// Margins
			text_view.left_margin = text_view.right_margin = 60;

			// Colors
			var rGBA = Gdk.RGBA(); rGBA.parse("black");
			text_view.override_color(Gtk.StateFlags.NORMAL, rGBA);

			scrolled.add(text_view);
			this.add(scrolled);
		}

		private Gtk.HeaderBar header() {
			var header = new Gtk.HeaderBar();

			/*
			 * Set properties of the Header Bar
			 */
			header.set_title("Writer");
			header.set_show_close_button(true);
			header.set_subtitle("Book1.writer");
			header.spacing = 0;
			//Get image from icon theme
			Gtk.Image img = new Gtk.Image.from_icon_name ("document-new", Gtk.IconSize.MENU);
			Gtk.ToolButton button2 = new Gtk.ToolButton (img, null);

			//Add Icon to header
			header.pack_start(button2);
			//Get another Icon.
			img = new Gtk.Image.from_icon_name ("document-open", Gtk.IconSize.MENU);
			Gtk.ToolButton button3 = new Gtk.ToolButton (img, null);

			//Add it again
			header.pack_start(button3);
			//Add a search entry to the header
			header.pack_start(new Gtk.SearchEntry());
			//Return it to be included somewhere else.
			return header;
		}

		/**
		 * Much like other programming langauges such as Java, we will define our main
		 * execution loop as a static method.
		 */
		public static int main(string[] args) {
				Gtk.init(ref args);
				AppWindow window = new AppWindow();
				window.show_all(); // Tell the window to draw
				Gtk.main();
				return 0;
		}
}
