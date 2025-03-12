local ritual = loadstring(game:HttpGet('https://raw.githubusercontent.com/thuarnel/rbx-ui-libs/refs/heads/main/Notifications/Lo/main.lua'))()

if type(ritual) == 'table' then
    ritual.Create('Title', 'Description', 1, Color3.new(1, 1, 1))
    task.wait(1)
    ritual.Clear()
end
