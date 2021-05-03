#set a custom resolution in vm
xrandr --newmode "1920x1080_120.00"  368.76  1920 2072 2288 2656  1080 1081 1084 1157  -HSync +Vsync
xrandr --addmode Virtual1 "1920x1080_120.00"
xrandr --output Virtual1 --mode "1920x1080_120.00"

#set a wallpaper
xwallpaper --stretch ~/Pictures/space.png

#keyboard
xset r rate 300 150
setxkbmap -option caps:escape

#update clock every minute
while true
do
    xsetroot -name "$( date +"%F %R" )"
    sleep 1m    # Update time every minute
done &

#start dwm
exec dwm
