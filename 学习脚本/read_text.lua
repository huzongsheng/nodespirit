click(R():path("/FrameLayout/ViewPager/LinearLayout"):hasChild(R():text("发现")))
sleep(1500)
for range=1,14 do
    a=R():id("cn.xuexi.android:id/general_card_title_id"):path("/FrameLayout/ViewPager/ViewGroup/RecyclerView/FrameLayout/TextView"):screen(1)
    while find(a) == nil do
        click(R():path("/FrameLayout/ViewPager/LinearLayout"):hasChild(R():text("发现")))
        sleep(4000)
    end
    view = find(a);--点击文章
    click(math.random(view.rect.left,view.rect.right),math.random(view.rect.top,view.rect.bottom))
    print(view.rect.left..','..view.rect.top..','..view.rect.right..','..view.rect.bottom);

    sleep(6000);
    --click(R():path("/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/View"):hasChild(R():text("订阅")))--点击订阅
    for n=1,11 do
        local r=R():path("/FrameLayout/WebView/m0/WebView");
        slid(r,1)
        sleep(math.random(1500,2000))

    end
    a=R():childCount(0):path("/FrameLayout/RecyclerView/LinearLayout/LinearLayout/TextView");
    local rule = R():id("com.freespace.aplug:id/tv_title_ip");
    local view = find(a);
    if view then
        print(view.text); -- 节点的文本 string
        click(R():text("欢迎发表观点"))
        putClipboard(view.text)
        sleep(600)
        click(240,1429)
        sleep(600)
        click(R():text("发布"))
        sleep(400)
    end
    back()
    sleep(400)
    click(R():id("cn.xuexi.android:id/home_bottom_tab_button_work"):desc("学习"))
    sleep(4000)
end
sleep(8000)
--这是阅读文章的功能模块，可以在阅读文章的过程中也把订阅任务给做了(订阅任务已废弃,关注太多了)
