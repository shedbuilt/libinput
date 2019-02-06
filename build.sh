#!/bin/bash
# Build and Install
mkdir build-libinput &&
cd build-libinput &&
meson --prefix=/usr         \
      -Dudev-dir=/lib/udev  \
      -Ddocumentation=false \
      -Dlibwacom=false      \
      -Ddebug-gui=false     \
      -Dtests=false         \
      .. &&
NINJAJOBS=$SHED_NUM_JOBS ninja &&
DESTDIR="$SHED_FAKE_ROOT" ninja install || exit 1
