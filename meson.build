project('com.github.foss-io.doca', 'vala', 'c')

subdir('data')
subdir('src')

executable(
    meson.project_name(),

    resources,

    docker_api_files,
    entity_files,
    os_files,
    service_files,
    widget_files,
    app_files,

    dependencies: [
        dependency ('gtk+-3.0'),
        dependency ('glib-2.0'),
        dependency ('granite')
    ],

    install: true
)

meson.add_install_script('meson/post_install.py')
