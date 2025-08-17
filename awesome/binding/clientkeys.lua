-- Standars Awesome library
pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local math = require("math")
local os = require("os")

local _M = {}
local modkey = RC.vars.modkey

function _M.get()
	local clientkeys = gears.table.join(
		awful.key({ modkey, }, "f",
			function(c)
				c.fullscreen = not c.fullscreen
				-- c.fullscreen = false
				c:raise()
			end,
			{ description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
		   { description = "close", group = "client" }),

		awful.key({ modkey, "Control" }, "space",
			function(c)
				c.floating = not c.floating
				awful.placement.no_offscreen(c)
			end,
			{ description = "toggle floating", group = "client" }),
		awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
			{ description = "move to master", group = "client" }),
		awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
			{ description = "move to screen", group = "client" }),
		awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
			{ description = "toggle keep on top", group = "client" }),
		awful.key({ modkey, }, "m",
			function(c)
				c.maximized = not c.maximized
				c:raise()
			end,
			{ description = "(un)maximize", group = "client" }),
		awful.key({ modkey, }, "u", function (c)			  c.sticky = not c.sticky
			  naughty.notify {title = c.name, text = "Toggled the sticky"}
		end,
		   { description = "toggle sticky", group = "client" }),
		awful.key({modkey, }, "a", function (c)
			  if not c.made then
				 c.t = c.t or 0
				 local const = c.x
				c.ontop = true
				c.sticky = true
				function animate(c, s, f, const)
				   c.x = c.x + s
				   c.y = c.y + f(c.x + s - const)
				   c.t = c.t + 1
				   naughty.notify { title = '(' .. c.x .. ' ' .. c.y .. ')' }
				end
				function func(x)
				   return 2 * math.sin(x / 10)
				   --return 2 * math.sin(x / 10) ^ 2
				end
				c.timer = gears.timer{
					timeout = 0.01,
					call_now = true,
					autostart = true,
					callback = function()
					   naughty.notify { title = '(' .. c.x .. ' ' .. c.y .. ')' }
					   animate(c, 1, func, const)
					end
				}
				c.made = true
				c.animating = true
			  elseif not c.animating then
				 c.timer:start()
				 c.animating = true
			  else
				 c.timer:stop()
				 c.animating = false
			  end
		end),
		{ description = "animate window", group = "client"}
	)
	return clientkeys
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
