QBCore = exports['qb-core']:GetCoreObject()

-- Function to handle consumption of a fentanyl pill
QBCore.Functions.CreateUseableItem('fentanyl_pill', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        -- Remove a pill from the player's inventory
        Player.Functions.RemoveItem('fentanyl_pill', 1)
        TriggerClientEvent('consume:pill', source, 'fentanyl_pill')
        -- Optional: Notify the player that the pill has been consumed
        TriggerClientEvent('QBCore:Notify', source, 'You consumed a Fentanyl Pill', 'success')
    end
end)


QBCore.Functions.CreateUseableItem('jiggas_pill', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.RemoveItem('jiggas_pill', 1)
        TriggerClientEvent('consume:pill', source, 'jiggas_pill')
        TriggerClientEvent('QBCore:Notify', source, 'You consumed a Jiggas Pill', 'success')
    end
end)
