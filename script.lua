local Places = {
	2768379856, -- SCP 3008
}

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

if table.find(Places, game.PlaceId) then
	Import("Games/" .. game.PlaceId)
else
	Import("Scripts/IY_Config")
end
