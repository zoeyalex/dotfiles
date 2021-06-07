nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

xrandr --output HDMI-0 --mode 1920x1080 --rate 144.01

#run composite manager in the background
picom --config .config/picom.conf &

#set wallpaper
xwallpaper --stretch ~/Pictures/neon_tree.png

#keyboard
xset r rate 300 90
setxkbmap -option caps:escape

#update status
while true
do
    sleep 1
    ~/.local/bin/status/status.sh
    sleep 59
done &

#start dwm
exec dbus-launch dwm
