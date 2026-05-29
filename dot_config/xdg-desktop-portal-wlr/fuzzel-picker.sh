#!/usr/bin/env bash

# 1. Get physical monitors
monitors=$(swaymsg -t get_outputs | jq -r '.[] | "Monitor: \(.name)"')

# 2. Get active windows
windows=$(swaymsg -t get_tree | jq -r '.. | select(.type? == "con" and .name? != null) | "Window: \(.name) [id=\(.id)]"')

# 3. Combine them and send to Fuzzel in dmenu mode
choice=$(echo -e "${monitors}\n${windows}" | fuzzel --dmenu --prompt="Select Share Target: ")

# 4. Pass the result back to the portal
if [[ "$choice" == Window:* ]]; then
    # Grab the window ID from the selected string
    window_id=$(echo "$choice" | grep -o 'id=[0-9]*' | cut -d= -f2)
    # Output the exact region dimensions for the portal
    swaymsg -t get_tree | jq -r ".. | select(.id? == ${window_id}) | \"\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)\""
else
    # Output the raw monitor name (e.g., eDP-1)
    echo "$choice" | sed 's/Monitor: //'
fi
