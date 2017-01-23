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

	public class Editor : Gtk.ScrolledWindow {

		construct {
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
			text_view.indent = 20;

			// Margins
			text_view.left_margin = text_view.right_margin = 60;

			// Colors
			var rGBA = Gdk.RGBA(); rGBA.parse("black");
			text_view.override_color(Gtk.StateFlags.NORMAL, rGBA);

			this.add(text_view);
		}

	}

}
