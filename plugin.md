function kimi(question)
    runApp("com.moonshot.kimichat")
    while find(R():desc("开启新会话")) == nil
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
        if k == 2 then
            answer = view.text
        end
    end
    return answer
end

