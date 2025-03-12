local notifLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/thuarnel/rbx-ui-libs/refs/heads/main/Notifications/Sw1ndler/main.lua"))()

notifLib:CreatePromptNotif({
    TweenSpeed = 1,
    Title = "Prompt Notification",
    Text = "Paragraph Text",
    Duration = 5,
    Callback = function(Value)
        print(Value)
    end
})

notifLib:CreateDefaultNotif({
    TweenSpeed = 1,
    Title = "Title",
    Text = "Paragraph Text",
    Duration = 5
})
