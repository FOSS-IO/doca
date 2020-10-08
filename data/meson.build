icon_sizes = ['16', '24', '32', '48', '64', '128']

icons_dir = join_paths(get_option('datadir'), 'icons', 'hicolor')

foreach size : icon_sizes
    asset = join_paths('assets', 'icons', '@0@x@0@'.format(size), '@0@.svg'.format(meson.project_name()))
    install_data(
        asset,
        install_dir:  join_paths(icons_dir, '@0@x@0@'.format(size), 'apps'),
        rename: '@0@.svg'.format(meson.project_name())
    )
    install_data(
        asset,
        install_dir: join_paths(icons_dir,  '@0@x@0@@2'.format(size), 'apps'),
        rename: '@0@.svg'.format(meson.project_name())
    )
endforeach

install_data(
    meson.project_name() + '.gschema.xml',
    install_dir: join_paths (get_option ('datadir'), 'glib-2.0', 'schemas')
)

resources = gnome.compile_resources(
    'resources',
    'assets.gresource.xml'
)

#Translate and install the .desktop file
i18n.merge_file (
    'desktop',
    input: meson.project_name() + '.desktop.in',
    output: meson.project_name() + '.desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications'),
    po_dir: join_paths(meson.source_root (), 'po', 'extra'),
    type: 'desktop'
)

#Translate and install the .appdata file
i18n.merge_file (
    'appdata',
    input: meson.project_name() + '.appdata.xml.in',
    output: meson.project_name() + '.appdata.xml',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo'),
    po_dir: join_paths(meson.source_root (), 'po', 'extra')
)
