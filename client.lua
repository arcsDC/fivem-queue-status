local queueData = {}

RegisterNetEvent('queue:update', function(data)
    queueData = data
    RefreshUI()
end)

RegisterNetEvent('queue:count', function(count, max)
    SetNuiCallback('queue:count', function()
        return { count = count, max = max }
    end)
    RefreshUI()
end)

function RefreshUI()
    local count = 0
    for _ in pairs(queueData) do
        count = count + 1
    end
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'update',
        count = count,
        max = 32
    })
end

RegisterNUICallback('queue:join', function(_, cb)
    TriggerServerEvent('queue:join')
    cb('ok')
end)

RegisterNUICallback('queue:leave', function(_, cb)
    TriggerServerEvent('queue:leave')
    cb('ok')
end)
