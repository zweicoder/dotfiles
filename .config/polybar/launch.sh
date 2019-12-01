#!/bin/env sh

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload blacksheep &
    xrandr --output $MONITOR --brightness 0.7
done
