Config = {}

-- Blip na mapie
Config.UseBlip = false -- najlepiej zostawic off
Config.BlipLocation = {
    {title="Darkshop", colour=37, id=47, x = -462.73, y = -66.37, z = 44.90},
}

-- Jesli uzywasz itemku pieniędzy, dla przykladu "money" jesli uzywasz ox_inventory
Config.CurrencyItem = 'money'

-- Menu dostępych napadów
Config.RobberyList = {
    [1] = {
        bank = false,
        Header = "Bank Fleeca",
        icon = "fa-solid fa-building-columns",
        minCops = 4,
    },
    [2] = {
        bank = false,
        Header = "Bank Paleto",
        icon = "fa-solid fa-building-columns",
        minCops = 4,
    },
    [3] = {
        bank = false,
        Header = "Bank Pacific",
        icon = "fa-solid fa-building-columns",
        minCops = 6
    },
}
-- konfiguracja sprzedawanych rzeczy w darkshopie
Config.Shop = {
    [1] = {
        item = "hack_usb",
        label = "Czarny Pendrive",
        price = 1500,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    },

    [2] = {
        item = "lhseed",
        label = "Nasiono Weed",
        price = 1050,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    }
    
}
