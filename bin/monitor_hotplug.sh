#!/bin/sh
#USER="john"
#export XAUTHORITY=/home/$USER/.Xauthority
#export DISPLAY=:0

########### Settings ###########

# Use 'xrandr' to find these
DP="DP1"
HDMI="HDMI1"
HDMI2="HDMI2"
INTERNAL_DISPLAY="eDP1"

function wait_for_monitor {
    xrandr | grep $INTERNAL_DISPLAY | grep '\bconnected'
    while [ $? -ne 0 ]; do
            logger -t "waiting for 100ms"
            sleep 0.1
            xrandr | grep $MONITOR | grep '\bconnected'
    done
}

# Check /sys/class/drm for the exact location
DP_STATUS="$(cat /sys/class/drm/card0-DP-1/status)"
HDMI_STATUS="$(cat /sys/class/drm/card0-HDMI-A-1/status)"
HDMI2_STATUS="$(cat /sys/class/drm/card0-HDMI-A-2/status)"

# Do no change!
EXTERNAL_DISPLAY=""
# Check to see if the external display is connected
if [ "${DP_STATUS}" = connected ]; then
EXTERNAL_DISPLAY=$DP
fi
if [ "${HDMI_STATUS}" = connected ]; then
EXTERNAL_DISPLAY=$HDMI
fi
if [ "${HDMI2_STATUS}" = connected ]; then
EXTERNAL_DISPLAY=$HDMI2
fi

# The external display is connected
if [ "$EXTERNAL_DISPLAY" != "" ]; then
# Set the display settings
wait_for_monitor
xrandr --output $INTERNAL_DISPLAY --off        # Turn off internal display
xrandr --output $EXTERNAL_DISPLAY --auto --primary    # Turn on external display

# The external display is not connected
else
# Restore internal display
xrandr --output $INTERNAL_DISPLAY --auto --primary
xrandr --output HDMI1 --off        # Turn off external display
fi

sh ~/.fehbg

exit 0
