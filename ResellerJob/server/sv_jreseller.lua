ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'reseller', 'reseller', 'society_reseller', 'society_reseller', 'society_reseller', {type = 'public'})

RegisterServerEvent('PaBLO:getStockItem')
AddEventHandler('PaBLO:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_reseller', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			--	if Config.EnableJobLogs == true then
			--		TriggerEvent('esx_joblogs:AddInLog', 'reseller', 'getSharedInventory', xPlayer.name, count, inventoryItem.label)
			--	end
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)
end)


ESX.RegisterServerCallback('PaBLO:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_reseller', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('PaBLO:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)
RegisterServerEvent('PaBLO:putStockItems')
AddEventHandler('PaBLO:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_reseller', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		--	if Config.EnableJobLogs == true then
		--		TriggerEvent('esx_joblogs:AddInLog', 'reseller', 'putStockItems', xPlayer.name, count, inventoryItem.label)
		--	end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

RegisterNetEvent('jojo:buypistol')
AddEventHandler('jojo:buypistol', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('WEAPON_PISTOL', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Pistolet~w~")
end)

RegisterNetEvent('jojo:buycal50')
AddEventHandler('jojo:buycal50', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('weapon_pistol50', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Calibre 50~w~")
end)

RegisterNetEvent('jojo:microsmg')
AddEventHandler('jojo:microsmg', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('weapon_microsmg', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Micro SMG~w~")
end)

RegisterNetEvent('jojo:carabine')
AddEventHandler('jojo:carabine', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('weapon_carbinerifle', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ une ~r~Carabine~w~")
end)


RegisterNetEvent('jojo:ak47')
AddEventHandler('jojo:ak47', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('weapon_assaultrifle', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ une ~r~AK 47~w~")
end)


RegisterNetEvent('jojo:pompe')
AddEventHandler('jojo:pompe', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon('weapon_pumpshotgun', 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez ~g~acheté~w~ un ~r~Pompe~w~")
end)

RegisterServerEvent('InteractSound_SV:PlayWithinDistance')
AddEventHandler('InteractSound_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)


