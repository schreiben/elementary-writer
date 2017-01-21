using Gtk;
using Gdk;

public class AppWindow : Gtk.Window {

	construct {
		this.title = "Elementary Writing";
		this.set_default_size(800, 800);
		this.destroy.connect(Gtk.main_quit);
		this.set_position(Gtk.WindowPosition.CENTER);
		this.set_titlebar(this.header());
		this.set_size_request(600, 400);
		this.add(this.editor());
	}

	private Gtk.Widget editor() {
		var scrolled = new Gtk.ScrolledWindow(null, null);
		var text_view = new Gtk.TextView();

		// Font
		var font_description = new Pango.FontDescription();
		font_description.set_family("Baskervald ADF Std");
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
		return scrolled;
	}

	private Gtk.HeaderBar header() {
		var header = new Gtk.HeaderBar();
		header.set_title("Elementary Writing");
		header.set_show_close_button(true);
		header.set_subtitle("<...>");
		header.spacing = 0;

		Gtk.Image img = new Gtk.Image.from_icon_name ("document-new", Gtk.IconSize.MENU);
		Gtk.ToolButton button = new Gtk.ToolButton (img, null);
		header.pack_start(button);

		img = new Gtk.Image.from_icon_name ("document-open", Gtk.IconSize.MENU);
		button = new Gtk.ToolButton (img, null);
		header.pack_start(button);

		return header;
	}

	public static int main(string[] args) {
		Gtk.init(ref args);
		AppWindow window = new AppWindow();
		window.show_all();
		Gtk.main();
		return 0;
	}
}
