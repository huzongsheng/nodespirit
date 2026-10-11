maii = {
    smtp = "smtp.qq.com",
    port = "465",
    from = "365782786@qq.com",
    password = "",--填写自己的邮件密码
    to = {"365782786@qq.com"},
    subject = "来自termux",
    content = "你的xtqg脚本已开始运行",
    --files = {'sdcard/history.s'}
}

sendMail(maii)
compile("EasyRun:1.1.4_release_repair_replace2")
exec('am force-stop cn.xuexi.android')
sleep(2000)
--exec('echo 0 > /sys/class/backlight/panel0-backlight/brightness')
runApp("cn.xuexi.android")
sleep(10000)
require 'listening'
require 'read_text'
require 'subscribe'
require 'watch_video'
require 'tiao_zhan_da_ti'
require 'answer_everyday'
print("wqok")



maii = {
    smtp = "smtp.qq.com",
    port = "465",
    from = "365782786@qq.com",
    password = "",
    to = {"365782786@qq.com"},
    subject = "来自termux",
    content = "你的xtqg脚本已运行完毕",
    --files = {'sdcard/history.s'}
}

sendMail(maii)



