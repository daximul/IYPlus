local function Import(Asset)
	local Link = string.format("https://raw.githubusercontent.com/daximul/IYPlus/main/%s.lua", Asset)
	local Response = game:HttpGetAsync(Link)
	local Function = loadstring(Response)

	local Success, Return = pcall(Function)
	if (Success) then
		return Return
	else
		warn("[IY+]: Failed to load Asset")
	end
end

Import("Scripts/IY_Config")
wait(1.1)
while true do
  game:GetService("Players").LocalPlayer.GameplayPaused = false
  wait(0.01)
end
