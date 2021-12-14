--[[
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████████─██████──████████─██████──────── █████████████── ████───────────████───█████████████ ─██████────────██████████████─██████──────────██████─████████████────────
─██░░░░░░░░░░░░░░██─██░░██──██░░░░██─██░░██────────██░░░░░░░░░░░██─██░░██──────── ██░░██─██░░░░░░░░░░░██─██░░██────────██░░░░░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██──────
─██░░██████████████─██░░██──██░░████─██░░██────────██░░███████████──██░░██───────██░░██──██░░███████████─██░░██────────██░░██████░░██─██░░░░░░░░░░██──██░░██─██░░██████░░░░██────
─██░░██─────────────██░░██──██░░██───██░░██────────██░░██───────────██░░██───────██░░██──██░░██──────────██░░██────────██░░██──██░░██─██░░██████░░██──██░░██─██░░██    ██░░░██───
─██░░██──██████████─██░░██████░░██───██░░██────────██░░███████████───██░░██─────██░░██───██░░███████████─██░░██────────██░░██████░░██─██░░██──██░░██──██░░██─██░░██     ██░░░██──
─██░░██──██░░░░░░██─██░░░░░░░░░░██───██░░██────────██░░░░░░░░░░░██───██░░██─────██░░██───██░░░░░░░░░░░██─██░░██────────██░░░░░░░░░░██─██░░██──██░░██──██░░██─██░░██      ██░░░██─
─██░░██──██████░░██─██░░██████░░██───██░░██────────██░░███████████────██░░██───██░░██────██░░███████████─██░░██────────██░░██████░░██─██░░██──██░░██──██░░██─██░░██     ██░░░██──
─██░░██──────██░░██─██░░██──██░░██───██░░██────────██░░██─────────────██░░██───██░░██────██░░██──────────██░░██────────██░░██──██░░██─██░░██──██░░██████░░██─██░░██    ██░░░██───
─██░░██████████░░██─██░░██──██░░████─██░░█████████─██░░███████████─────██░░█████░░██─────██░░███████████─██░░█████████─██░░██──██░░██─██░░██──██░░░░░░░░░░██─██░░██████░░░░██────  
─██░░░░░░░░░░░░░░██─██░░██──██░░░░██─██░░░░░░░░░░█─██░░░░░░░░░░░██─────██░░░░░░░░░██─────██░░░░░░░░░░░██─██░░░░░░░░░░█─██░░██──██░░██─██░░██──██████████░░██─██░░░░░░░░░░██──────
─██████████████████─██████──████████─█████████████─███████████████──────███████████──────███████████████─█████████████─██████──██████─██████──────────██████─████████████────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]--

local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local usingLimit = false

RegisterCommand('fart', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed, false)
    local maxSpeed = GetVehicleHandlingFloat(veh,"CHandlingData","fInitialDriveMaxFlatVel")
    local fart = args[1]

    if IsPedInAnyVehicle(playerPed, false) then
        if GetPedInVehicleSeat(veh, -1) then
            if fart == '50' then
                SetVehicleMaxSpeed(veh, 13.888889)
                ESX.ShowHelpNotification("Begrænsning sat til ~y~50~s~ km/t.")
                ESX.ShowNotification("Fart Begrænser: Tryk ~y~X~s~ for at slå ~r~fra~s~")
                usingLimit = true
            elseif fart == '80' then
                SetVehicleMaxSpeed(veh, 22.222222)
                ESX.ShowHelpNotification("Begrænsning sat til ~y~80~s~ km/t.")
                ESX.ShowNotification("Fart Begrænser: Tryk ~y~X~s~ for at slå ~r~fra~s~")
                usingLimit = true
            elseif fart == '100' then
                SetVehicleMaxSpeed(veh, 27.777778)
                ESX.ShowHelpNotification("Begrænsning sat til ~y~100~s~ km/t.")
                ESX.ShowNotification("Fart Begrænser: Tryk ~y~X~s~ for at slå ~r~fra~s~")
                usingLimit = true
            elseif fart == '130' then
                SetVehicleMaxSpeed(veh, 36.111111)
                ESX.ShowHelpNotification("Begrænsning sat til ~y~130~s~ km/t.")
                ESX.ShowNotification("Fart Begrænser: Tryk ~y~X~s~ for at slå ~r~fra~s~")
                usingLimit = true
            elseif fart == nil and usingLimit then
                SetVehicleMaxSpeed(veh, maxSpeed)
                ESX.ShowNotification("Fart Begrænser: Slået ~r~fra~s~!")
                usingLimit = false
            elseif fart == nil then 
                ESX.ShowNotification("Fart Begrænser: Du kan vælge mellem ~y~50~s~, ~y~80~s~, ~y~100~s~ og ~y~130~s~ km/t")
            else
                ESX.ShowNotification("Fart Begrænser: Du kan vælge mellem ~y~50~s~, ~y~80~s~, ~y~100~s~ og ~y~130~s~ km/t")
            end
        else 
            ESX.ShowNotification("Du skal være på ~r~førersædet~s~!")
        end
    else
        ESX.ShowNotification("Du er ~r~ikke~s~ i et køretøj!")
    end
    Citizen.Wait(1)

    while usingLimit == true do
        Citizen.Wait(1)
        if IsControlJustPressed(0, 105) then
            SetVehicleMaxSpeed(veh, maxSpeed)
            ESX.ShowNotification("Fart Begrænser: Slået ~r~fra~s~!")
            usingLimit = false
        end
    end
end)
