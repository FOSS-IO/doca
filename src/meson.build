entity_files = files (
    'entity/Container.vala',
    'entity/Image.vala',
    'entity/Process.vala',
    'entity/Stats.vala'
)

service_files = files (
    'service/adapter/IContainerService.vala',
    'service/ContainerService.vala'
)

app_files = files (
    'Main.vala'
)

docker_api_files = files (
    'docker_api/adapter/IDockerEngineApi.vala',
    'docker_api/DockerEngineApi.vala'
)

executable(
    meson.project_name(),
    entity_files,
    service_files,
    app_files,
    docker_api_files,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('glib-2.0')
    ],
    install: true
)
