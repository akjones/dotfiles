
Teams = {}
Gather = {}

function Teams.toggleMute()
    local app = hs.application.find("com.microsoft.teams")
    return hs.eventtap.keyStroke({"cmd","shift"}, "m", 0, app)
end

function Teams.toggleCamera()
    local app = hs.application.find("com.microsoft.teams")
    return hs.eventtap.keyStroke({"cmd","shift"}, "o", 0, app)
end

function Gather.toggleMute()
    local app = hs.application.find("com.gather.Gather")
    return hs.eventtap.keyStroke({"cmd","shift"}, "a", 0, app)
end

function toggleMute()
    Teams.toggleMute()
    Gather.toggleMute()
    return
end

local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "1", toggleMute)
hs.hotkey.bind(hyper, "2", Teams.toggleCamera)
