local new_notification = loadstring(game:HttpGet('https://raw.githubusercontent.com/thuarnel/rbx-ui-libs/refs/heads/main/Notifications/Scar/main.lua'))()

if type(new_notification) == 'function' then
    new_notification({
        Speed = 0.1,
        Text = "This is a Notification.",
        Duration = 5,
        Center = true,
        Outline = true,
    })
end