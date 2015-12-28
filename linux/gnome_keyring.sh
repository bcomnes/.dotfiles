#!/bin/bash

# enable gnome keyring
# https://wiki.archlinux.org/index.php/GNOME_Keyring#With_a_display_manager
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
