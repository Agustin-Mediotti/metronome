# project name and programming language
project('com.github.Agustin-Mediotti.metronome', 'vala', 'c')

# Include the translations module
i18n = import('i18n')
​
# Set our translation domain
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')


# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    meson.project_name(),
    'src' / 'Application.vala',
    dependencies: [
        dependency('gtk4')
    ],
    install: true
)

#Translate and install our .desktop file
i18n.merge_file(
    input: 'data' / 'hello-again.desktop.in',
    output: meson.project_name() + '.desktop',
    po_dir: meson.source_root() / 'po',
    type: 'desktop',
    install: true,
    install_dir: get_option('datadir') / 'applications'
)
​
#Translate and install our .metainfo file
i18n.merge_file(
    input: 'data' / 'hello-again.metainfo.xml.in',
    output: meson.project_name() + '.metainfo.xml',
    po_dir: meson.source_root() / 'po',
    install: true,
    install_dir: get_option('datadir') / 'metainfo'
)


subdir('po')
