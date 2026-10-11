--每日答题
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
click(R():id("cn.xuexi.android:id/comm_head_xuexi_score"):childCount(0):path("/FrameLayout/FrameLayout/LinearLayout/TextView"))--点击积分
sleep(3000)
if find(R():text("去答题"))==nil then
    exec("am force-stop cn.xuexi.android")
    runApp("cn.xuexi.android")
    sleep(8000)
    print("已退出")--每日答题
end
click(R():text("去答题"))--点击每日答题
sleep(3000)
for range=1,3 do
    while find(R():text("再来一组"))==nil do
        rule=R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/TextView");
        local view = find(rule);--获取题目
        if view then
            text=view.text
        end
        a=find(R():childCount(0):path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/TextView"))--判断题目类型（单选题，多选题，填空题）
        if a.text =="单选题" then
            a=R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/ListView/View/View/TextView");
            Table = {}
            local views = finds(a);--获取答案列表
            for k,view in pairs(views) do
                Table[k]=view.text
            end
            print(Table)
            text=kimi("快速回答以下问题我只要答案中的中文内容。不需要答案前的英文符号！例如答案“A.湖州”我将拒绝。我仅允许“湖州” \n\n"..text.."以上是题目，下面是答案\n\n"..table.concat(Table,""))
            print(text)
            runApp("cn.xuexi.android")
            sleep(1500)
            click(R():text('.*'..text..'.*'):getParent())--通过文本点击答案
            sleep(300)
            click(R():text("确定"))
            click(R():text("完成"))
            sleep(300)
            click(R():text("下一题"))
            sleep(2500)
          elseif a.text =="多选题" then
            click(R():childCount(3):path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/ListView/View/View"))
            sleep(500)
            click(R():text("确定"))
            click(R():text("完成"))
            sleep(300)
            click(R():text("下一题"))
            sleep(300)
          elseif a.text =='填空题' then
            --click(R():type("EditText"))
            mytable = {}
            local views = finds(R():path("/FrameLayout/DrawerLayout/FrameLayout/WebView/m0/WebView/View/View/View/View/View/TextView"))
            for k,view in pairs(views) do
                mytable[k]=view.text
                if k==3 then
                    print(view.text); -- 节点的文本 string
                    text=view.text
                end
            end
            print(table.concat(mytable))
            kimi("快速回答以下问题我只要答案中的中文内容。不需要其他提示或者符号\n\n"..table.concat(mytable).."以上是填空题题目")
            click(R():desc("复制"))
            runApp("cn.xuexi.android")
            sleep(1000)
            click(R():type("EditText"))
            sleep(1000)
            click(145,1407)
            click(R():text("确定"))
            sleep(1500)
            click(R():text("下一题"))
          else--填空题
            back()
            sleep(400)
            click(R():text("退出"))
            sleep(2000)
            if find(R():text("去答题"))==nil then
                range = 3 --退出来发现答完题了直接跳出循环直接结束
            end
            click(R():text("去答题"))--点击每日答题
            sleep(3000)
        end
    end
    click(R():text("再来一组"))
    sleep(1000)
end
back()
sleep(500)
back()
sleep(500)
sleep(8000)
print("已退出")--每日答题

