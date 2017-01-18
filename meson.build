project('elementary-writing',['c','vala'])

add_global_arguments('-DGETTEXT_PACKAGE="elementary-writing"',language: 'c')

atk_dep = dependency('atk')
cairo_dep = dependency('cairo')
gdk_3_0_dep = dependency('gdk-3.0')
gdk_pixbuf_2_0_dep = dependency('gdk-pixbuf-2.0')
gio_2_0_dep = dependency('gio-2.0')
glib_2_0_dep = dependency('glib-2.0')
gobject_2_0_dep = dependency('gobject-2.0')
gtk_3_0_dep = dependency('gtk+-3.0')
pango_dep = dependency('pango')
pangocairo_dep = dependency('pangocairo')
x11_dep = dependency('x11')

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'elementary-writing'),join_paths(meson.current_source_dir(),'data/local','','*'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/elementary-writing.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
install_data('data/icons/elementary-writing.svg',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/scalable/apps'))
cfg_elementary-writing = configuration_data()
cfg_elementary-writing.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_elementary-writing.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'elementary-writing'))
cfg_elementary-writing.set('GETTEXT_PACKAGE', 'elementary-writing')
cfg_elementary-writing.set('RELEASE_NAME', 'elementary-writing')
cfg_elementary-writing.set('PREFIX', get_option('prefix'))
cfg_elementary-writing.set('VERSION', '1.0.0')
cfg_elementary-writing.set('TESTSRCDIR', meson.current_source_dir())

cfgfile_1 = configure_file(input: 'src/Config.vala.base',output: 'Config_1.vala',configuration: cfg_elementary-writing)

elementary-writing_deps = [atk_dep]
elementary-writing_deps += [cairo_dep]
elementary-writing_deps += [gdk_3_0_dep]
elementary-writing_deps += [gdk_pixbuf_2_0_dep]
elementary-writing_deps += [gio_2_0_dep]
elementary-writing_deps += [glib_2_0_dep]
elementary-writing_deps += [gobject_2_0_dep]
elementary-writing_deps += [gtk_3_0_dep]
elementary-writing_deps += [pango_dep]
elementary-writing_deps += [pangocairo_dep]
elementary-writing_deps += [x11_dep]
elementary-writing_sources = [cfgfile_1]
elementary-writing_sources += ['src/elementary-writing.vala']

executable('elementary-writing',elementary-writing_sources,dependencies: elementary-writing_deps,install: true)

