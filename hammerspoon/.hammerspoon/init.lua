hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.w = f.w - 15
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.h = f.h + 15
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.h = f.h - 15
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.w = f.w + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 15
  win:setFrame(f)
end)

-- emacs
hs.hotkey.bind({"cmd", "ctrl"}, "E", function()
    hs.execute("/Users/j/bin/ose")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 15
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 15
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)



hs.hotkey.bind({"cmd","alt","ctrl"}, "Left", function() --Win Half Left
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()


  f.x = max.x + 10
  f.y = max.y + 10
  f.w = max.w / 2 - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function() --Win Half Right
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2) + 10
  f.y = max.y + 10
  f.w = max.w / 2 - 20 
  f.h = max.h - 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function() --Win Half Up
  local win = hs.window.focusedWindow()

  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10 
  f.w = max.w - 20
  f.h = max.h / 2 - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function() --Win Half Down
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + (max.h / 2) 
  f.w = max.w - 20
  f.h = max.h / 2 - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd","alt","ctrl",}, "Z", function() --Win Top Left
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2 + 10
  f.y = max.y / 2 + 10
  f.w = max.w / 2 - 10
  f.h = max.h / 2 - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd","alt","ctrl",}, "X", function() --Win Bottom Left
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2 + 10
  f.y = max.y + (max.h / 2) + 10
  f.w = max.w / 2 - 10
  f.h = max.h / 2 - 20
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd","alt","ctrl",}, "V", function() --Win Bottom Right
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2) + 10
  f.y = max.y + ( max.h / 2) + 10
  f.w = max.w / 2 - 20
  f.h = max.h / 2 - 20
  win:setFrame(f)
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config Loaded"}):send()

hs.hotkey.bind({"cmd","ctrl"}, "S", function() --Launch Safari
  hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({"cmd","ctrl"}, "T", function() --iTerm2
  hs.application.launchOrFocus("iTerm2")
end)
 
hs.hotkey.bind({"cmd","ctrl"}, "M", function() --Mail
  hs.application.launchOrFocus("Mail")
end)

hs.hotkey.bind({"cmd","ctrl","alt"}, "F", function() --Pretty Fullscreen
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = max.w - 20
  f.h = max.h - 20
  win:setFrame(f)
end)

function writer_insert_table()
  hs.application.launchOrFocus("iA Writer")
  local writer = hs.appfinder.appFromName("iA Writer")
  local str_table = {"Format", "Add Table"}
  local table = writer:findMenuItem(str_table)
  writer:selectMenuItem(str_table)
end
hs.hotkey.bind({"cmd","ctrl"}, "W", function() -- iA Writer
  hs.application.launchOrFocus("iA Writer")
end)
hs.hotkey.bind({"cmd","alt"}, "K", writer_insert_table)


function randTest()
	local value = math.rand()
	hs.notify.new({title="Hammerspoon", informativeText=value}):send()
end

hs.hotkey.bind({"cmd","alt","shift"}, "C",function()
	os.execute("say -v Yuri сука блять")
end
)
hs.hotkey.bind({"cmd","alt","shift"}, "F",function()
	os.execute("say -v Anna Sieg heil mein Führer")
end)

hs.hotkey.bind({"cmd","alt","shift"}, "I", function()
	os.execute("say We must secure the existence of our race and a future for white children")
end)

local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
	if state then
		caffeine:setTitle("Awake")
	else
		caffeine:setTitle("Sleepy")
	end
end

function caffeineClicked()
	setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
	caffeine:setClickCallback(caffeineClicked)
	setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

local wifiWatcher = nil
local homeSSID = "Resnet"
local lastSSID = hs.wifi.currentNetwork()
function ssidChangedCallback()
	newSSID = hs.wifi.currentNetwork()

	if newSSID == homeSSID and lastSSID ~= homeSSID then
		hs.audiodevice.defaultOutputDevice():setVolume(25)
	elseif newSSID ~= homeSSID and lastSSID == homeSSID then
		hs.audiodevice.defaultOutputDevice():setVolume(0)
	end

	lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

hs.hotkey.bind({"ctrl"}, 'o', function()
    local app = hs.application.frontmostApplication()
    local element = hs.uielement.focusedElement():role()
    if app:name() == "Safari" then
        hs.eventtap.keyStroke({"cmd"}, "l")
    end
end)

hs.hotkey.bind({"ctrl"}, '/', function()
    local app = hs.application.frontmostApplication()
    local element = hs.uielement.focusedElement():role()
    if app:name() == "Safari" then
        hs.eventtap.keyStroke({"cmd"}, "f")
    end
end)

