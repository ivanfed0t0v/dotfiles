#!/bin/sh

########### Settings ###########

# Use 'xrandr' to find these
MONITORS=("eDP1" "HDMI1" "VGA-1")

# Check /sys/class/drm for the exact location
STATUSES=(
          "$(cat /sys/class/drm/card0-eDP-1/status)"
          "$(cat /sys/class/drm/card0-HDMI-A-1/status)"
          "$(cat /sys/class/drm/card0-DP-1/status)"
)

INTERNAL_MONITOR="LVDS-1"

# Use monitor_hotplug.local to override default settings
if [ -f $HOME/bin/monitor_hotplug.local ]; then
    source $HOME/bin/monitor_hotplug.local
fi

function wait_for_monitor {
    xrandr | grep $INTERNAL_MONITOR | grep '\bconnected'
    while [ $? -ne 0 ]; do
        logger -t "waiting for 100ms"
        sleep 0.1
        xrandr | grep $INTERNAL_MONITOR | grep '\bconnected'
    done
}

# Do no change!
EXTERNAL_MONITOR=""

# Check to see if the external display is connected
for i in ${!MONITORS[*]}
do
    if [ "${STATUSES[$i]}" = connected ]; then
        EXTERNAL_MONITOR=${MONITORS[$i]}
    fi
done

# The external display is connected
if [ "$EXTERNAL_MONITOR" != "" ]; then
    # Set the display settings
    wait_for_monitor
    xrandr --output $INTERNAL_MONITOR --off        # Turn off internal display
    xrandr --output $EXTERNAL_MONITOR --auto --primary    # Turn on external display

# The external display is not connected
else
    # Restore internal display
    xrandr --output $INTERNAL_MONITOR --auto --primary
    xrandr --output HDMI1 --off        # Turn off external display
fi

bash ~/.fehbg

exit 0
