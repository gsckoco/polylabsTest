-- Ping Controller
-- gsck
-- May 6, 2021



local PingController = {}

local PING_REMOTE_EVENT = "PingRemoteEvent"

function PingController:Start()

    local button = game:GetService("Workspace"):WaitForChild("Button")
    local clickDetector = button:WaitForChild("ClickDetector")
    local pingGui = button:WaitForChild("SurfaceGui"):WaitForChild("Ping")

    clickDetector.MouseClick:Connect(function()
        pingGui.Text = math.floor(self:GetPing() * 1000) .. "ms"
    end)

    print(self:GetPing())
end

function PingController:GetPing()
    local pingEvent = self.Services.PingService[PING_REMOTE_EVENT]

    local startTime = tick()
    pingEvent:Fire()
    pingEvent:Wait()

    return tick() - startTime
end

function PingController:Init()

end


return PingController