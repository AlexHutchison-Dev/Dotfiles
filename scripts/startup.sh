#!/bin/bash

xrandr --output eDP1 --scale 0.88x0.88
setxkbmap -option caps:escape
chsh -s $(/usr/bin/zsh)
