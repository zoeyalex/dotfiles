#nvidia high performance
xrandr --setprovideroutputsource modesetting NVIDIA-0
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

#disable monitor 1 and use monitor 2
xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --rate 120.0 --preferred
xrandr --output HDMI-1 --set "PRIME Synchronization" 1

#run composite manager in the background
picom --config .config/picom.conf &

#set wallpaper
xwallpaper --stretch ~/Pictures/lake_night.jpg

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
