-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	-- Table of layouts to cover with awful.layout.inc, order matters.
	local layouts = {
		awful.layout.suit.floating, -- 1;
		awful.layout.suit.tile, -- 2;
		awful.layout.suit.tile.left, -- 3;
		awful.layout.suit.tile.bottom, -- 4;
		awful.layout.suit.tile.top, -- 5;
		awful.layout.suit.max.fullscreen, -- 6;
	}

	return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
