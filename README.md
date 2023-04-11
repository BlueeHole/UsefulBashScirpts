# UsefulBashScirpts
平时用到的一些Bash脚本。

## 定时提醒弹窗

- `notify_send_cron.sh`

```bash
if gnome-screensaver-command -q | grep -q "is inactive"
then
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u normal -t 10000 -i appointment-new '小宝提醒你' '起来活动一下，善待眼睛，善待腰椎、颈椎'
fi
```

- 检测若没有锁屏（若没有锁屏，输出会含有`inactive`，而grep匹配成功会返回0，而if检测命令运行成功是靠返回0），则使用notify-send进行弹窗，`-i`是图标，之所以要先设置XDG_RUNTIME_DIR，是参考[这个答案](https://stackoverflow.com/questions/16519673/cron-with-notify-send)，否则无法弹窗成功。
- 然后，使用cron定时命令。意思是在指定的时间运行这个脚本（记得chmod+x）
- 运行`crontab -e`，在其中加一句

```bash
0 0,10-12,15-18,20-23 * * * /path/to/nofity_send_cron.sh
```

- crontab语法：

    - ```
        *     *     *     *     *  command to be executed
        -     -     -     -     -
        |     |     |     |     |
        |     |     |     |     +----- day of the week (0 - 6) (Sunday is 0)
        |     |     |     +------- month (1 - 12)
        |     |     +--------- day of the month (1 - 31)
        |     +----------- hour (0 - 23)
        +------------- min (0 - 59)
        ```

- 因此我的意思是在***每个月每天0点，10-12点，15-18点，20-23点***的0分运行脚本。
