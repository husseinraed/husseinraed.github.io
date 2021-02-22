---
title: Understanding ReservedServer in Roblox
published: true
---

## example 1

### teleport to a reserved server using game chat

#### step 1: get required services
```lua
local TS = game:GetService("TeleportService")
local Players = game:GetService("Players")
local DSS = game:GetService("DataStoreService")
local DS = DSS:GetGlobalDataStore()
```

#### step 2: reserve a server
```lua
-- Get the saved code
local code = DS:GetAsync("ReservedServer")

if type(code) ~= "string" then -- Not saved, create one
        code = TS:ReserveServer(game.PlaceId)
        DS:SetAsync("ReservedServer",code)
end
```

#### step 3: wait for chat message and join server if player types /join
```lua

function WatchPlayer(player)
    if player.Chatted:Connect(function(msg)
	if msg == "/join" then
	    TS:TeleportToPrivateServer(game.PlaceId, code, {player}, "name_of_spawn_point") -- teleport to the private server
	
	-- u can remove "name_of_spawn_Point" if u want the palyers to spawn in the default location of the private server
	end
    end)
end

Players.PlayerAdded:Connect(WatchPlayer) -- whenever a player joins we want to watch all his messages using the WatchPlayer function

for k,v in pairs(Players:GetPlayers()) do -- run the WatchPlayer function on every player in the current server
    WatchPlayer(v)
end
```

#### done! thats it

