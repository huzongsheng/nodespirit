click(R():id("cn.xuexi.android:id/comm_head_xuexi_score"):childCount(0):path("/FrameLayout/FrameLayout/LinearLayout/TextView"))--点击积分
sleep(2000)--点击积分
click(R():text("订阅"):getBrother(5))
sleep(1000)
click(R():desc("待订阅"))
sleep(1000)
click(R():desc("订阅"):target(1))
sleep(1000)
click(R():desc("订阅"):target(1))
back()
sleep(500)
back()
sleep(2000)

