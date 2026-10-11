click(R():desc("电视台"))
sleep(1000)
click(R():path("/FrameLayout/ViewPager/LinearLayout"):hasChild(R():text("联播频道")))
sleep(300)
click(R():path("/FrameLayout/GridView/RelativeLayout"):hasChild(R():text("联播频道")))
sleep(300)
click(R():childCount(3):path("/FrameLayout/ViewPager/ViewGroup/RecyclerView/FrameLayout"):hasChild(R():text("中央广播电视总台")))
sleep(300)
for range=1 ,7 do
    sleep(70000)
    slid(R():path("/FrameLayout/RecyclerView"),1)
end
back()
sleep(5000)
--看视屏
