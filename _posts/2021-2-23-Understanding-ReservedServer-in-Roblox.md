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
```

#### step 2: wait for chat message
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
```

#### done! thats it

