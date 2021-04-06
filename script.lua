local Places = {
	2768379856, -- SCP 3008
}

local plrSer = game:GetService("Players")
local PromptOverlay = CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")

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

PromptOverlay.DescendantAdded:Connect(function(Overlay)
	if Overlay.Name == "ErrorTitle" then
		Overlay:GetPropertyChangedSignal("Text"):Connect(function()
			if Overlay.Text:sub(0, 12) == "Disconnected" then
				if #plrSer:GetPlayers() <= 1 then
					plrSer.LocalPlayer:Kick("\nRejoining...")
					wait()
					game:GetService("TeleportService"):Teleport(game.PlaceId, plrSer.LocalPlayer)
				else
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plrSer.LocalPlayer)
				end
			end
		end)
	end
end)

if syn and syn.queue_on_teleport then
	syn.queue_on_teleport('loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/daximul/IYPlus/main/script.lua"))()')
end
