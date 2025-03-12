local notification_library = loadstring(game:HttpGet('https://raw.githubusercontent.com/thuarnel/rbx-ui-libs/refs/heads/main/Notifications/Stefanuk12/main.lua'))()

if type(notification_library) == 'table' then
    notification_library.send_notification("Test Title - Success", "Test Body", "success")
    task.wait(0.5)
    notification_library.send_notification("Test Title - Alert", "Test Body", "alert")
    task.wait(0.5)
    notification_library.send_notification("Test Title - Error", "Test Body", "error")
    notification_library.send_notification("Test Title - Custom", "Test Body", Color3.fromRGB(255, 255, 255), { body_font = Enum.Font.Cartoon, wait_time = 4 })
end


