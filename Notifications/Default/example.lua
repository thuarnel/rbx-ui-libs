local responseHandler = Instance.new("BindableFunction")
responseHandler.OnInvoke = function(response)
    if response == "Button1" then
        print("Player clicked Button1")
    elseif response == "Button2" then
        print("Player clicked Button2")
    end
end

local function sendNotification()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Choose an Option",
        Text = "Please select one of the buttons below.",
        Duration = 5,
        Callback = responseHandler,
        Button1 = "Option A",
        Button2 = "Option B"
    })
end

sendNotification()
