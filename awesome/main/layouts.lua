local awful = require("awful")
local bling = require("bling")

local _M = {}

function _M.get()
   local layouts = {
		awful.layout.suit.fair,
		awful.layout.suit.fair.horizontal,
		awful.layout.suit.floating
   }
   return layouts
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
