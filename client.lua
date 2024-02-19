local QBCore = exports['qb-core']:GetCoreObject()

local function PlayPillAnimation(gender, duration)
    local animDict = "mp_suicide"
    local animName = "pill" -- Use the same animation for both genders

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
end

-- Determine character's gender
local function GetPlayerGender()
    local model = GetEntityModel(PlayerPedId())
    if model == GetHashKey("mp_f_freemode_01") then
        return "female"
    elseif model == GetHashKey("mp_m_freemode_01") then
        return "male"
    else
        return "unknown" -- For custom models or if unable to determine
    end
end

RegisterNetEvent('consume:pill', function(pillType)
    local playerPed = PlayerPedId()
    local gender = GetPlayerGender()

    PlayPillAnimation(gender, 5000) -- Duration parameter adjusted to match the progress bar

    QBCore.Functions.Progressbar("taking_pill", "Taking Pill...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(playerPed) -- Ensure the animation is stopped after the progress bar completes
        
        local overdoseChance = math.random(1, 100) -- Random chance for overdose
        local overdosed = overdoseChance <= 10 -- 10% chance to overdose

        -- Check for overdose
        if overdosed then
            QBCore.Functions.Notify("You've overdosed!", "error")
            SetEntityHealth(playerPed, 0)
            return
        end

        QBCore.Functions.Notify("You start feeling relaxed.", "primary", 5000)

        -- Initial screen effect upon successful pill consumption
        StartScreenEffect("DrugsTrevorClownsFight", 120000, true)

        -- Heal over time logic with screen effect on each cycle
        local endTime = GetGameTimer() + (20 * 60000) -- 20 minutes in milliseconds
        Citizen.CreateThread(function()
            while GetGameTimer() < endTime and GetEntityHealth(playerPed) > 0 do
                Citizen.Wait(300000) -- Wait 5 minutes
                local maxHealth = GetEntityMaxHealth(playerPed)
                local healAmount = math.random(8, 16) / 100 * maxHealth -- 8-16% of max health
                local newHealth = math.min(GetEntityHealth(playerPed) + healAmount, maxHealth)
                SetEntityHealth(playerPed, newHealth)
                QBCore.Functions.Notify("You're feeling better.", "primary", 5000)
                
                -- Re-trigger the screen effect for each health regeneration cycle
                StartScreenEffect("DrugsTrevorClownsFight", 120000, false)
            end

            -- Once the 20 minutes have passed, stop the screen effect to return to normal
            StopScreenEffect("DrugsTrevorClownsFight")
            QBCore.Functions.Notify("The effects have worn off.", "primary", 5000)
        end)
    end, function() -- Cancelled
        QBCore.Functions.Notify("Cancelled..", "error")
        ClearPedTasks(playerPed)
    end)
end)
