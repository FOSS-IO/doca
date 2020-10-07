project('com.github.foss-io.doca', 'vala', 'c')

subdir('data')
subdir('src')

executable(
    meson.project_name(),
    resources,
    entity_files,
    service_files,
    app_files,
    docker_api_files,
    widget_files,
    dependencies: [
        dependency ('gtk+-3.0'),
        dependency ('glib-2.0'),
        dependency ('granite'),
        dependency ('libosinfo-1.0')
    ],
    install: true
)

meson.add_install_script('meson/post_install.py')
