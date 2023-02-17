-- Triggery pod opierdalanie bankow
-- zrob cos takiego TriggerClientEvent('vape-market:client:SetBankCD', -1, true) jesli bank jest okradany
-- zrob cos takiego TriggerClientEvent('vape-market:client:SetBankCD', -1, false) jesli bank mozna okrasc

local CurrentCops = 0
local BankRobberyCD = false

-- Blip na mapie (config)
CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlip then
	   		info.blip = AddBlipForCoord(info.x, info.y, info.z)
	   		SetBlipSprite(info.blip, info.id)
	   		SetBlipDisplay(info.blip, 4)
	   		SetBlipScale(info.blip, 0.6)
	   		SetBlipColour(info.blip, info.colour)
	   		SetBlipAsShortRange(info.blip, true)
	   		BeginTextCommandSetBlipName("STRING")
	   		AddTextComponentString('<FONT FACE="Sora">'.. info.title)
	   		EndTextCommandSetBlipName(info.blip)
	 	  end
   end
end)

RegisterNetEvent('vape-market:activity', function()
            local header = {}
            for k, v in pairs(Config.RobberyList) do
                if CurrentCops >= v.minCops then
                    if not v.bank or (v.bank and not BankRobberyCD) then
                        header[#header+1] = {
                            id = v.Header,
                            title = v.Header,
                            description = '✔️ Dostępne',
                        }
                    else
                        header[#header+1] = {
                            id = v.Header,
                            title = v.Header,
                            description = '❌ Niedostępne',
                        }
                    end
                else
                    header[#header+1] = {
                        id = v.Header,
                        title = v.Header,
                        description = '❌ Niedostępne',

                    }
                end
            end

            header[#header+1] = {
                id = 'Close (ESC)',
                title = '❌ Wyjdź (ESC)',
            }
            lib.registerContext({
                id = 'availablerobberies',
                title = '❗❎ Dostępne ❎❗',
                options = header
            })
            lib.showContext('availablerobberies')
end)


local itemNames = {}

for item, data in pairs(exports.ox_inventory:Items()) do
    itemNames[item] = data.label
end

RegisterNetEvent('vape-market:buyitems', function(data)
    local header = {}
    for k, v in pairs(Config.Shop) do
        if v.item then
            header[#header+1] = {
                id = v.item.label,
                title = v.label,
                description = "Cena: $"..v.price,
                serverEvent = "vape-market:server:buyshit",
                args = k
            }
        end
    end

    header[#header+1] = {
        id = "Close (ESC)",
        title = "❌ Wyjdź (ESC)",
    }
    lib.registerContext({
        id = 'robberyitems',
        title = '💲 Specjalne 💲',
        options = header
    })
    lib.showContext('robberyitems')
end)

RegisterNetEvent('vape-market:client:SetBankCD', function(bool)
    BankRobberyCD = bool
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

exports.qtarget:AddTargetModel({-1463670378}, {
    options = {
        {
            event = "vape-market:activity",
            icon = "fas fa-clock",
            label = "Sprawdź Dostępność",
            num = 2
        },
        {
            event = "vape-market:buyitems",
            icon = "fas fa-laptop-code",
            label = "Zobacz Ofertę",
            num = 1
        },
    },
    distance = 2.5
})
