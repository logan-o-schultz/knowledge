#!/bin/bash

swww img /home/logan/assets/red-skull.gif
hyprctl keyword general:col.active_border 'rgb(ff0000) rgb(600000)'
cp /home/logan/.config/waybar/root-style.css /home/logan/.config/waybar/style.css
clear
su
swww img /home/logan/assets/blue-plasma.gif &
hyprctl keyword general:col.active_border 'rgba(00ffe0ee) rgba(204090ee)'
cp /home/logan/.config/waybar/logan-style.css /home/logan/.config/waybar/style.css
clear
