local queue = {}
local maxPlayers = 32

RegisterNetEvent('queue:join', function()
    local src = source
    if not queue[src] then
        queue[src] = true
        TriggerClientEvent('queue:update', -1, queue)
    end
end)

RegisterNetEvent('queue:leave', function()
    local src = source
    if queue[src] then
        queue[src] = nil
        TriggerClientEvent('queue:update', -1, queue)
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    if queue[src] then
        queue[src] = nil
        TriggerClientEvent('queue:update', -1, queue)
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        local count = 0
        for _ in pairs(queue) do
            count = count + 1
        end
        TriggerClientEvent('queue:count', -1, count, maxPlayers)
    end
end)
