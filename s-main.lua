-- Core

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Fin del core

-- Inicio de eventos

RegisterServerEvent("dz-itemsbreakdown:telefonoroto")
AddEventHandler("dz-itemsbreakdown:telefonoroto", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local broken_phone = xPlayer.getInventoryItem("phone")["count"]
     if broken_phone > 0 then
     xPlayer.removeInventoryItem("phone", broken_phone)
     xPlayer.addInventoryItem('broken_phone', 1)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Se te ha estropeado el teléfono...',  length = 3000})
    end
end)

RegisterServerEvent("dz-itemsbreakdown:dinerolimpio")
AddEventHandler("dz-itemsbreakdown:dinerolimpio", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local dinerolimpio = xPlayer.getMoney()
     if dinerolimpio > 0 then
     xPlayer.removeMoney(dinerolimpio)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Se te ha estropeado el dinero...',  length = 3000})
    end
end)

RegisterServerEvent("dz-itemsbreakdown:dineronegro")
AddEventHandler("dz-itemsbreakdown:dineronegro", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local dineronegro = xPlayer.getAccount('black_money').money
     if dineronegro > 0 then
     xPlayer.removeAccountMoney('black_money', dineronegro)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Se te ha estropeado el dinero negro...',  length = 3000})
    end
end)

-- Fin de eventos

-- Item usable

ESX.RegisterUsableItem('phone_repair', function(source)
	TriggerClientEvent('dz-itemsbreakdown:progressbar', source);
	Citizen.Wait(7500)
	local xPlayer = ESX.GetPlayerFromId(source)
	local phone_repair = xPlayer.getInventoryItem('phone_repair').count
	local phoneitem = xPlayer.getInventoryItem('broken_phone')
	if phoneitem.count >= 1 then
		if phone_repair >= 1 then
			xPlayer.removeInventoryItem('phone_repair', 1)
			Citizen.Wait(1000)
			xPlayer.removeInventoryItem('broken_phone', 1)
			Citizen.Wait(1000)
			xPlayer.addInventoryItem('phone', 1)
		end
	end
end)

-- Creado por Dizzy