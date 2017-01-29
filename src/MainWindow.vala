// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/***
  BEGIN LICENSE

  Copyright (C) 2017-2018 Tilman Kamp <tilmankamp@posteo.de>
  This program is free software: you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License version 3, as
  published    by the Free Software Foundation.

  This program is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranties of
  MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
  PURPOSE.  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program.  If not, see <http://www.gnu.org/licenses>

  END LICENSE
***/

namespace ElementaryWriting {

	public class MainWindow : Gtk.Window {

		public ElementaryWritingApp app { get; set; }

		public MainWindow(ElementaryWritingApp app) {
			this.app = app;
		}

		construct {
			this.title = "Elementary Writing";
			this.set_default_size(800, 800);
			this.destroy.connect(Gtk.main_quit);
			this.set_position(Gtk.WindowPosition.CENTER);
			this.set_titlebar(this.header());
			this.set_size_request(600, 400);
			this.add(new Editor());
		}

		public void read_from_file(File file) {

		}

		public void restore_opened_documents() {

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
	}

}
