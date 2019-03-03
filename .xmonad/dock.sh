#!/bin/bash
# Cribbed from https://gist.github.com/kyokley/169646c27ed2dcc470b6

# wait for the dock state to change
sleep 1
USERS=$(last | grep "no logout" | cut -d " " -f1 | uniq)

for user in "${USERS}"; do
    case "$1" in
        "0")
            #undocked event
            logger "undocked event for ${user}"
        ;;
        "1")
            #docked event
            logger "undocked event for ${user}"
        ;;
    esac
    DISPLAY=:0.0 su ${user} -c "bash /home/tstrader/.xmonad/dock_helper.sh"
done
exit 0
