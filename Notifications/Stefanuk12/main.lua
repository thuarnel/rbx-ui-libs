local notification_library = {
    main_colour = Color3.fromRGB(255, 119, 244),
    background_colour = Color3.fromRGB(25, 25, 25),
    secondary_background_colour = Color3.fromRGB(15, 15, 15),
    success = Color3.fromRGB(119, 221, 119),
    error = Color3.fromRGB(255, 150, 150),
    alert = Color3.fromRGB(253, 253, 150),
    body_font = Enum.Font.SourceSans,
    body_text_color3 = Color3.fromRGB(255, 255, 255),
    title_font = Enum.Font.GothamBlack,
    title_text_color3 = Color3.fromRGB(255, 255, 255),
    wait_time = 2,
    storage_location = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
    gui_name = "NotificationGUI",
    notification_name = "Notification",
}

function notification_library.fail_safe_checks(custom_theme)
    if not custom_theme or type(custom_theme) ~= "table" then
        return notification_library
    end
    
    for key, value in pairs(notification_library) do
        if not custom_theme[key] or typeof(custom_theme[key]) ~= typeof(value) then
            custom_theme[key] = value
        end
    end
    return custom_theme
end

function notification_library.return_base_notification(custom_theme)
    custom_theme = notification_library.fail_safe_checks(custom_theme)

    local notification = Instance.new("Frame")
    local status_bar = Instance.new("Frame")
    local status_colour = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local body = Instance.new("TextLabel")
    local status_colour_line = Instance.new("Frame")

    if not custom_theme.storage_location:FindFirstChild(custom_theme.gui_name) then
        local notification_gui = Instance.new("ScreenGui")
        notification_gui.Name = custom_theme.gui_name
        notification_gui.Parent = custom_theme.storage_location
        notification_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    end

    local notification_gui = custom_theme.storage_location:WaitForChild(custom_theme.gui_name)
    notification.Name = custom_theme.notification_name
    notification.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    notification.BorderColor3 = Color3.fromRGB(255, 119, 244)
    notification.ClipsDescendants = true
    notification.Position = UDim2.new(0, 0, 0, 0)
    notification.Size = UDim2.new(0, 400, 0, 100)
    
    status_bar.Name = "status_bar"
    status_bar.Parent = notification
    status_bar.BackgroundColor3 = Color3.fromRGB(255, 146, 245)
    status_bar.BorderSizePixel = 0
    status_bar.Size = UDim2.new(0, 20, 0, 100)
    status_bar.ZIndex = 5

    status_colour.Name = "status_colour"
    status_colour.Parent = notification
    status_colour.BackgroundColor3 = Color3.fromRGB(199, 255, 174)
    status_colour.BorderSizePixel = 0
    status_colour.Size = UDim2.new(0, 25, 0, 100)
    status_colour.ZIndex = 4

    title.Name = "title"
    title.Parent = notification
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1.0
    title.BorderSizePixel = 0
    title.Position = UDim2.new(0.0625, 0, 0, 0)
    title.Size = UDim2.new(0, 375, 0, 35)
    title.ZIndex = 3
    title.Font = Enum.Font.GothamBlack
    title.Text = "Title"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16.0

    body.Name = "body"
    body.Parent = notification
    body.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    body.BorderColor3 = Color3.fromRGB(27, 42, 53)
    body.BorderSizePixel = 0
    body.Position = UDim2.new(0.0625, 0, 0.35, 0)
    body.Size = UDim2.new(0, 375, 0, 65)
    body.ZIndex = 2
    body.Font = Enum.Font.SourceSans
    body.Text = "Body"
    body.TextColor3 = Color3.fromRGB(255, 255, 255)
    body.TextSize = 16.0
    body.TextWrapped = true

    status_colour_line.Name = "status_colour_line"
    status_colour_line.Parent = notification
    status_colour_line.BackgroundColor3 = Color3.fromRGB(199, 255, 174)
    status_colour_line.BorderSizePixel = 0
    status_colour_line.Position = UDim2.new(0, 0, 0.35, 0)
    status_colour_line.Size = UDim2.new(0, 400, 0, 1)
    status_colour_line.ZIndex = 2

    return notification
end

function notification_library.get_y(custom_theme)
    local highest = 0.80
    local notification_gui = custom_theme.storage_location:WaitForChild(custom_theme.gui_name)
    
    for _, child in pairs(notification_gui:GetChildren()) do
        if child.Position.Y.Scale > highest then
            highest = child.Position.Y.Scale - 0.15
        end
    end
    
    return highest
end

function notification_library.send_notification(title_text, body_text, notification_type, custom_theme)
    coroutine.wrap(function()
        title_text = tostring(title_text or "")
        body_text = tostring(body_text or "")
        custom_theme = notification_library.fail_safe_checks(custom_theme)
        
        local notification = notification_library.return_base_notification(custom_theme)
        local notification_gui = custom_theme.storage_location:WaitForChild(custom_theme.gui_name)
        
        if not notification_type or (typeof(notification_type) ~= "string" and typeof(notification_type) ~= "Color3") or (typeof(notification_type) == "string" and not custom_theme[notification_type]) then
            notification_type = "success"
        end
        
        if type(notification_type) == "string" then
            notification_type = custom_theme[notification_type]
        end
        
        notification.Position = UDim2.new(0, 0, notification_library.get_y(custom_theme), 0)
        notification.Size = UDim2.new(0, 0, 0, 100)
        notification.BorderColor3 = custom_theme.main_colour
        notification.BackgroundColor3 = custom_theme.background_colour
        notification.status_bar.BackgroundColor3 = custom_theme.main_colour
        notification.status_colour_line.BackgroundColor3 = notification_type
        notification.status_colour.BackgroundColor3 = notification_type
        
        notification.title.Text = title_text
        notification.title.Font = custom_theme.title_font
        notification.body.BackgroundColor3 = custom_theme.secondary_background_colour
        notification.body.Text = body_text
        notification.body.Font = custom_theme.body_font
        
        notification.Parent = notification_gui
        
        local connection = notification_gui.ChildRemoved:Connect(function(child)
            if child ~= notification then
                notification:TweenPosition(UDim2.new(0, 0, notification.Position.Y.Scale + 0.15, 0), "In", "Quad", 0.5)
            end
        end)
        
        notification:TweenSize(UDim2.new(0, 400, 0, 100), "In", "Quad", 0.25)
        task.wait(custom_theme.wait_time)
        
        notification:TweenSize(UDim2.new(0, 0, 0, 100), "In", "Quad", 0.25, false, function()
            notification:Destroy()
            connection:Disconnect()
        end)
    end)()
end

return notification_library