# ![Doca](data/assets/doca_logo.png)

> Gtk Client for Docker

Doca is a native Gtk client for managing docker containers.

## Building development version

```bash
meson build --prefix=/usr
cd build
ninja install
./src/com.github.foss-io.doca
```

## Development setup

### Technology

- [Vala](https://wiki.gnome.org/Projects/Vala/)
- [Meson](https://mesonbuild.com/)
- [Ninja](https://ninja-build.org/)

### Libraries

- [gtk+ 3.0](https://valadoc.org/gtk+-3.0/Gtk.html)
- [glib 2.0](https://valadoc.org/glib-2.0/GLib.html)
- [granite](https://valadoc.org/granite/Granite.html)

### IDE

- [Visual Studio Code](https://code.visualstudio.com/)
- [Vala](https://marketplace.visualstudio.com/items?itemName=prince781.vala)
- [Meson](https://marketplace.visualstudio.com/items?itemName=asabil.meson)
- [ninja-build](https://marketplace.visualstudio.com/items?itemName=surajbarkale.ninja)
- [Uncrustify](https://marketplace.visualstudio.com/items?itemName=LaurentTreguier.uncrustify)
