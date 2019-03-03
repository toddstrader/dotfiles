#!/bin/bash
# Cribbed from https://gist.github.com/kyokley/169646c27ed2dcc470b6

FIRST_EXTERNAL='DP2'
LCD_SCREEN='LVDS1'

logger 'Running dock/undock script'

# Start by activating the laptop screen
xrandr --output ${FIRST_EXTERNAL} --off > /tmp/dock_helper.log 2>&1
logger "Setting ${LCD_SCREEN} as primary monitor"
xrandr --output ${LCD_SCREEN} --auto --primary >> /tmp/dock_helper.log 2>&1

# Attempt to determine which external screens are attached
xrandr | grep "${FIRST_EXTERNAL} connected" >> /tmp/dock_helper.log 2>&1
if [ $? -eq 0 ]; then
    logger "Found ${FIRST_EXTERNAL}. Adding ${FIRST_EXTERNAL} as secondary and keeping ${LCD_SCREEN} on"
    xrandr --output ${FIRST_EXTERNAL} --auto --right-of ${LCD_SCREEN} >> /tmp/dock_helper.log 2>&1
fi
