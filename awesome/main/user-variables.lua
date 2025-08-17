local _M = {
   terminal = "alacritty",
   modkey = "Mod4",
   editor = "emacs",
   home = os.getenv("HOME"),

}

_M.editor_cmd = _M.terminal .. " -e " .. _M.editor

return _M
