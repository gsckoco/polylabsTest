-- Ping Service
-- gsck
-- May 6, 2021



local PingService = {Client = {}}

local PING_REMOTE_EVENT = "PingRemoteEvent"

function PingService:Start()
	self:ConnectClientEvent(PING_REMOTE_EVENT, function(player)
        self:FireClient(PING_REMOTE_EVENT, player)
    end)
end


function PingService:Init()
    self:RegisterClientEvent(PING_REMOTE_EVENT)
end


return PingService