#!/bin/sh

layout_toggle() {
    awesome-client 'require("awful").layout.inc(1, client.screen);'
}

current_layout() {
    STATUS=$(awesome-client 'return mouse.screen.selected_tag.layout.name')
    echo "$STATUS" | cut -d' ' -f2 | sed 's/"//g'
}

case "$1" in
    --toggle)
        layout_toggle
        ;;
    *)
        current_layout
        ;;
esac
