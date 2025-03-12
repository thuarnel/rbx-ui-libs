local modern = loadstring(game:HttpGet('https://raw.githubusercontent.com/insanedude59/notiflib/main/main'))()

--[=[
    modern:Notification(title, description, title_font, description_font, time_length)

    Sends a notification with a title, description, custom fonts, and a specified display duration.

    @param title           <string>  - The main title text of the notification
    @param description     <string>  - The description or body text of the notification
    @param title_font      <string>  - The font style to be used for the title text
    @param description_font<string>  - The font style to be used for the description text
    @param time_length     <number>  - The duration (in seconds) the notification stays on screen
]=]--

modern:Notification('Title', 'Description', 'GothamSemibold', 'Gotham', 5) 