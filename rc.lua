pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
-- autofocus
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user_variables")
-- modkey = RC.vars.modkey

-- Error handling
require("main.error_handling")

-- -- Variable definitions
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- beautiful.wallpaper = RC.vars.wallpaper

-- Themes
require("main.theme")
-- -- --

-- Calling All Module Libraries

-- Custom Local Library
local main = {
	layouts = require("main.layouts"),
	tags = require("main.tags"),
	menu = require("main.menu"),
	rules = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
	globalbuttons = require("binding.globalbuttons"),
	clientbuttons = require("binding.clientbuttons"),
	globalkeys = require("binding.globalkeys"),
	bindtotags = require("binding.bindtotags"),
	clientkeys = require("binding.clientkeys"),
	userkeys = require("binding.userkeys"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys
RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)
RC.globalkeys = binding.userkeys(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- Statusbar: Wibar
-- require("deco.statusbar")

-- Rules
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- Signals
require("main.signals")

local statusbar = require("statusbar.arrow.statusbar")

statusbar()
