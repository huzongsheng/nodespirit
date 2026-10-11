function kimi(question)
    runApp("com.moonshot.kimichat")
    while (find(R():desc("导航按钮")) == nil)
        do
        sleep(500)
    end
    click(R():desc("开启新会话"))
    sleep(500)
    r=R():text("尽管问，带图也行"):getParent()
    input(r,question);sleep(300)
    a=find(R():desc("发送讯息"))
    click((a.rect.left+a.rect.right)/2,(a.rect.top+a.rect.bottom)/2)
    while (find(R():desc("复制"))==nil)
        do
        sleep(500)
    end
    local rule = R():path("/FrameLayout/ComposeView/View/View/View/View/View/View/View/View/View/View/View/View/TextView")
    local views = finds(rule);
    for k,view in pairs(views) do
        if k == 1 then
            answer = view.text
        end
    end
    return answer
end

function 挑战答题()
    local n = 0
    while find(R():text("再来一局"))==nil and n<=12 do
        sleep(2500)
        if find(R():text("立即复活")) then
            click(R():text("立即复活"))
            sleep(4000)
        end
        if find(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/View")) then
            text=find(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/View")).text--获取题目
        end
        Table = {}
        local views = finds(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/ListView/View/View/TextView"));--获取答案列表
        for k,view in pairs(views) do
            Table[k]=view.text
        end
        texta=kimi("回答以下问题我只要答案不需要其他回答！而且要快速回答！\n\n"..text.."\n\n以上是题目，下面是答案从中选！注意我只需要答案!\n\n"..table.concat(Table,","))
        runApp("cn.xuexi.android")
        sleep(2000)
        click(R():text(texta):getParent())--点击 ai 返回的答案
        n = n + 1;print(n)--最多回答十四道题就走了
    end
    while find(R():text("结束本局"))==nil do--做对14题就够了提前离场
        click(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/ListView/View/View/RadioButton"))
    end
    click(R():text("结束本局"))
    sleep(5000)
end
function 四人赛()
    click(R():text("规则说明"))
    sleep(1000)
    if find(R():text("四人赛规则说明")) then
        click(R():text("开始比赛"))
        while find(R():text("继续挑战"))==nil do
            click(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/View/View/View/View/ListView/View/View"):target(math.random(1,3)))
        end

    end
    --趣味答题的四人赛快速全乱蒙
end
function 双人赛()
    a={'#3B3FB5-90','[{"a":0.661,"d":6.004,"id":"1","r":696.0},{"a":-0.272,"d":3.61,"id":"2","r":203.0},{"a":-0.294,"d":2.172,"id":"3","r":307.0}]',0.85}
    local 结果 = findShape(a)
    sleep(1000)
    for k,v in pairs(结果) do
        click(v.x,v.y)
    end
    while find(R():text("继续挑战"))==nil do
        click(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/View/View/View/View/View/ListView/View/View"):target(math.random(1,3)))
    end
    --趣味答题的双人赛快速全乱蒙
end
--------------main_趣味答题
click(R():id("cn.xuexi.android:id/comm_head_xuexi_score"):childCount(0):path("/FrameLayout/FrameLayout/LinearLayout/TextView"))--点击积分
sleep(2000)--点击积分
click(R():text("趣味答题"):getBrothers())--太聪明！ 使用兄弟节点
sleep(3000)
if find(R():text("挑战答题")) then
    click(R():text("科普知识"):getParent())
    sleep(5000)
    挑战答题()
  elseif #ocrp({match='.*四.*';line=false; }) > 0 then
    四人赛()
  else
    双人赛()
end
exec("am force-stop cn.xuexi.android")
runApp("cn.xuexi.android")
print("已退出")
sleep(15000)
