-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey
local alkey = RC.vars.altkey
local us = RC.vars.user_scripts

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Key bindings

function _M.get(globalkeys)
	local allkeys = gears.table.join(
		globalkeys,
		awful.key({}, "XF86AudioRaiseVolume", function()
			os.execute(string.format("amixer -q set '%s' 1%%+", "Master"))
			-- beautiful.volume.update()
		end, { description = "volume up", group = "hotkeys" }),
		awful.key({}, "XF86AudioLowerVolume", function()
			os.execute(string.format("amixer -q set '%s' 1%%-", "Master"))
			-- beautiful.volume.update()
		end, { description = "volume down", group = "hotkeys" }),
		awful.key({}, "XF86AudioMute", function()
			os.execute(string.format("amixer -q set '%s' toggle", "Master"))
			-- beautiful.volume.update()
		end, { description = "toggle mute", group = "hotkeys" }),
		awful.key({}, "XF86TouchpadToggle", function()
			awful.spawn.with_shell(us .. "TouchpadToggle")
		end, { description = "TouchpadToggle", group = "hotkeys" }),
		awful.key({}, "Print", function()
			awful.spawn.with_shell("flameshot gui")
		end, { description = "PrintScreen", group = "hotkeys" }),

		awful.key({}, "XF86MonBrightnessUp", function()
			awful.spawn.with_shell("sudo Light -mon 1")
		end, { description = "+1%", group = "hotkeys" }),
		awful.key({}, "XF86MonBrightnessDown", function()
			awful.spawn.with_shell("sudo Light -mon -1")
		end, { description = "-1%", group = "hotkeys" }),
		awful.key({}, "XF86KbdBrightnessUp", function()
			os.execute("sudo Light -kbd inc")
		end, { description = "+10%", group = "hotkeys" }),
		awful.key({}, "XF86KbdBrightnessDown", function()
			os.execute("sudo Light -kbd dec")
		end, { description = "-10%", group = "hotkeys" }),

		awful.key({ modkey, "Control" }, "t", function()
			awful.spawn.with_shell(us .. "Translate")
		end, { description = "Google translate", group = "hotkeys" }),
		awful.key({ modkey, "Control" }, "b", function()
			awful.spawn.with_shell(us .. "bluetooth")
		end, { description = "Connect bluetootch device", group = "hotkeys" }),
		awful.key({ modkey, "Control" }, "w", function()
			awful.spawn.with_shell(us .. "Wifi")
		end, { description = "Wifi module", group = "hotkeys" }),
		awful.key({ modkey, "Control" }, "m", function()
			awful.spawn.with_shell(us .. "Mounted")
		end, { description = "Mount script", group = "Mounted" }),
		awful.key({ modkey, "Control" }, "u", function()
			awful.spawn.with_shell(us .. "Umounted")
		end, { description = "Umount script", group = "Mounted" }),

		awful.key({ modkey, "Control" }, "q", function()
			awful.spawn.with_shell(us .. "ScreenLock")
		end, { description = "Screen Lock", group = "awesome" })
	)
	return allkeys
end
-- }}}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
