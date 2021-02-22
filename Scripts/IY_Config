local oldwait = wait
getfenv().wait = function()end
local WAS_LOADED = IY_LOADED
getgenv().IY_LOADED = false
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
getgenv().IY_LOADED = WAS_LOADED
getfenv().wait = oldwait
