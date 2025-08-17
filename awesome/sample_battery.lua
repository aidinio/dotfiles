gears.timer {
    timeout = 0,
    callback = 
           function ()
               proxy.on_g_signal =
                   function(_, _, _, upower_battery)
                       local objv2 = upower_battery:get_child_value(1):print(true)
                       percentage_value = string.match(tostring(device.percentage), "(.*)%.")
                       percentage_widget:update_text()
                       icon_path = get_battery_icon(device.state, device.percentage)
                       icon_widget:update_icon()
                   end
               naughty.notify{title = "FROM THE TIMER", text = "FROM THE TIMER"}
               lgi.GLib.MainLoop():run()
           end,
    autostart = true,
    -- call_now = true,
    single_shot = true,
}
