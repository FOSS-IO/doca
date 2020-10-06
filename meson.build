project('com.github.foss-io.doca', 'vala', 'c')

# Include the gnome module
gnome = import('gnome')
resources = gnome.compile_resources(
    'as-resources', 'data/assets.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

subdir('data')
subdir('src')

meson.add_install_script('meson/post_install.py')
