local dxhooknotify = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/dxhooknotify/src.lua", true))()

if dxhooknotify then
    dxhooknotify:Notify('Title', 'Description', 5)
end