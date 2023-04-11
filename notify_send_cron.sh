
if gnome-screensaver-command -q | grep -q "is inactive"
then
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u normal -t 10000 -i appointment-new '小宝提醒你' '起来活动一下，善待眼睛，善待腰椎、颈椎'
fi
