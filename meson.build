project('com.github.phoneybadger.ruler', 'c', 'vala')

subdir('src')

glib_dep = dependency('glib-2.0')
gtk_dep = dependency('gtk+-3.0')
granite_dep = dependency('granite')

ruler_dependencies = [glib_dep, gtk_dep, granite_dep]

executable(
  meson.project_name(),
  ruler_source_files,
  dependencies: ruler_dependencies
)
