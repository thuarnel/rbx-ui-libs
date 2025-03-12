local MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()

--[[ 
   MessageBox Icons:
      • "Question"
      • "Error"
      • "Warning"

   MessageBox Buttons:
      • "YesNo"
      • "OKCancel"
      • "OK"
--]]

-- MessageBox with anchor point (0.5, 0.5)
MessageBox.Show({
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Text = "Notification UI",
    Description = "Windows 10 MessageBox\nMade by: xHeptc\n\nDo you like this?",
    MessageBoxIcon = "Question",
    MessageBoxButtons = "YesNo",
    Result = function(res)
        if res == "Yes" then
            MessageBox.Show({
                MessageBoxButtons = "OK",
                Description = "Wow, you said Yes! Thank you",
                Text = "YAYYY!"
            })
        elseif res == "No" then
            MessageBox.Show({
                MessageBoxButtons = "OK",
                Description = "Ahh, sorry to disappoint, I'll try better next time!",
                Text = "Nooooo"
            })
        end
    end
})
