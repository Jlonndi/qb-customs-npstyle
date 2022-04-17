local QBCore = exports['qb-core']:GetCoreObject()
local inBenny = false

CreateThread(function()
    while true do
        Wait(1000)
        if not IsPedInAnyVehicle(PlayerPedId()) and inBenny then         
            exports['qb-radialmenu']:AddOption(5)
        end
    end
end)

RegisterNetEvent("qb-benny:client:repair", function()
    SendNUIMessage({sound = "wrench", volume = 1.0})
    QBCore.Functions.Progressbar("repair_car", "Repairing Vehicle...", 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('iens:repaira')
        TriggerEvent('vehiclemod:client:fixEverything')
    end)
end)