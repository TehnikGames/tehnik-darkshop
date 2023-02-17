ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ox_inventory = exports.ox_inventory

RegisterNetEvent('vape-market:server:buyshit', function(ped)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not source or not xPlayer or not ped then return end
    local cash = ox_inventory:Search(source, 'count', Config.CurrencyItem)
    print(cash)

    if (cash >= Config.Shop[ped].price) then
        ox_inventory:RemoveItem(source, 'money', Config.Shop[ped].price)
        ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
        
    end
end)