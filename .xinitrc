nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"
#disable monitor 1 and use monitor 2
#xrandr --newmode "1920x1080_120.00"  368.76  1920 2072 2288 2656  1080 1081 1084 1157  -HSync +Vsync
#xrandr --addmode HDMI-1 "1920x1080_120.00"
xrandr --output eDP-1 --off
xrandr --output HDMI-1 --mode 1920x1080 --rate 120.0

#set a wallpaper
xwallpaper --stretch ~/Pictures/space.png

#keyboard
xset r rate 300 150
setxkbmap -option caps:escape

#update clock every minute
while true
do
    xsetroot -name "$( date +"%A %d-%m-%Y %R" )"
    sleep 1m    # Update time every minute
done &

#start dwm
exec dbus-launch dwm
