#!/bin/bash

#	plankrm.sh
#	Plank-Resolution-Monitor, it tracks the current resolution
#	and if a change in resolution is detected, restarts plank.
#   Because this file is auto executed from plank.desktop once Gnome is ready
#   it would also start plank initially.
#	It has to be run on the contestant user
#
#	Copyright (C) 2023, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>
#
#	Authors:
#		Daniel Cerna <dcerna@huronos.org>

## Starts plank the first time
plank &
## Set initial resolution
CURRENT_RESOLUTION=$(xrandr | grep '\*' | awk '{print $1}')

## Listen for changes to the resolution
while true; do
  NEW_RESOLUTION=$(xrandr | grep '\*' | awk '{print $1}')
  ## If a new resolution is detected
  if [ "$NEW_RESOLUTION" != "$CURRENT_RESOLUTION" ]; then
    echo "Resolution changed to $NEW_RESOLUTION. Restarting Plank..."
    ## Kills the current plank instance
    killall plank
    ## Restarts plank in the background
    plank &
    CURRENT_RESOLUTION=$NEW_RESOLUTION
  fi
  sleep 1
done