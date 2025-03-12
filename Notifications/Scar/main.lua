return function(options)
    task.spawn(function()
        local camera = workspace.CurrentCamera
        
        if typeof(camera) == 'Instance' then
            options = options or {}
    
            local notification = {
                text = options.Text or "Danones sponsors this space",
                color = options.Color or Color3.fromRGB(255, 0, 0),
                duration = options.Duration or 3,
                center = options.Center or true,
                outline = options.Outline or true,
                speed = options.Speed or 0.5
            }
    
            local notification_text = Drawing.new("Text")
    
            notification_text.Visible = true 
            notification_text.Font = 2
            notification_text.Center = notification.center
            notification_text.Size = 15
            notification_text.Outline = notification.outline
            notification_text.Transparency = 1
            notification_text.Color = notification.color
            notification_text.Text = notification.text
            notification_text.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
    
            for step = 0, 10, notification.speed do
                task.wait()
                notification_text.Position = Vector2.new(notification_text.Position.X, math.clamp(notification_text.Position.Y - ((notification.speed * 10) * step), camera.ViewportSize.Y/2, math.huge))
                notification_text.Transparency = (step - notification.speed) / 10
                if notification_text.Position.Y == camera.ViewportSize.Y/2 then
                    notification_text.Transparency = 1
                    break
                end
            end

            task.wait(notification.duration)
            for fade_step = 1, 100 do
                task.wait()
                notification_text.Transparency = notification_text.Transparency - 0.01
            end

            notification_text:Remove()
        end
    end)
end