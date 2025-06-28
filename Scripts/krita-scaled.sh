#!/usr/bin/env bash
# Super + Shift + K
# Workaround for Krita scaling on my HiDPI monitor in XWayland
# This should be removed when Krita supports Wayland

QT_SCALE_FACTOR="1.35" gtk-launch org.kde.krita
