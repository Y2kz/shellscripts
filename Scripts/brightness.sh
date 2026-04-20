#!/bin/bash
echo "-------------------------------------------";echo "MONITOR"
xrandr | grep "connected primary"|awk '{print $1,$2}'
echo "-------------------------------------------";echo ""

echo "SET SCREEN BRIGHTNESS";echo "eg:0.4 , 1 "
read brightness
echo ""

echo "-------------------------------------------"
xrandr --output LVDS-1 --brightness $brightness
echo Brightness value SET to $brightness
echo "-------------------------------------------"

#xdotool key XF86MonBrightnessDown
#Up
##################################
#echo "Do you Want to:"
#echo "1.Increase Brightness"
#echo "2.Decrease Brightness"
#read brightness
#NEED WHILE LOOP HERE
