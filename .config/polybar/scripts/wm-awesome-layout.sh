#!/bin/sh

STATUS=$(awesome-client 'return mouse.screen.selected_tag.layout.name')

layout_toggle() {
    $(awesome-client 'local awful = require("awful");
    local t = awful.screen.focused().selected_tag;
    awful.layout.inc(1, client.screen);')
}

current_layout() {
    echo $STATUS | cut -d' ' -f2 | sed 's/"//g'
}

case "$1" in
    --toggle)
        layout_toggle
    ;;
    *)
        current_layout
    ;;
esac
