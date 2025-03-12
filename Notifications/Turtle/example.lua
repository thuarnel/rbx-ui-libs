local TurtleNotifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/source.lua"))()
local NotificationLibrary = TurtleNotifications.new(false, 2)

--[[ 
    Arguments for QueueNotification:
    1. WaitTime: Time until the notification disappears (0 = stays until user interacts).
    2. Title: The notification title.
    3. Description: Text under the title.
    4. Type: "Cancel-Continue" (Cancel & Continue buttons) or "Ok" (Ok button only).
    5. Callbacks: A dictionary defining what happens when buttons are clicked.
       Example for "Cancel-Continue": 
       {
           Cancel = function() print("Cancel Pressed") end, 
           Continue = function() print("Continue Pressed") end
       }
       Example for "Ok": 
       {
           Ok = function() print("Ok Pressed") end
       }
    6. (Optional) Positions: Defines start and end positions for the notification.
       Example:
       {
           Start = UDim2.new(0.7, 0, 1, 0),
           End = UDim2.new(0.7, 0, 0.8, 0)
       }
       The notification starts at "End," moves to "Start," then back to "End."

    Returns two bindable events:
    - Fired when the notification starts.
    - Fired when the notification ends (after duration or user interaction).
]]--

NotificationLibrary:QueueNotification(5, "Test Title", "Example Text!", "Ok", {
    Ok = function() 
        print("Ok Pressed!")
    end
})

-- Displays a popup at the specified position with a button
NotificationLibrary:Popup(UDim2.new(0.5, 0, 0.5, 0), {{
    Text = "Test Button",
    Callback = function()
        print("Test Button Pressed")
    end
}})

-- Sets the global delay for notifications
NotificationLibrary:SetNotificationDelay(5)
