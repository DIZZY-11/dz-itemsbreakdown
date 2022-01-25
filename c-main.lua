-- Core

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Fin del core

-- Inicio de funciones

Citizen.CreateThread(function()
	while true do 
		playerid = PlayerPedId()
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1200)
		if IsEntityInWater(playerid) and IsPedSwimming(playerid) then
			if Config.TelefonoRoto == true then
			TriggerServerEvent('dz-itemsbreakdown:telefonoroto')
			if Config.DineroLimpio == true then
			TriggerServerEvent('dz-itemsbreakdown:dinerolimpio')
			 if Config.DineroNegro == true then 
			 TriggerServerEvent('dz-itemsbreakdown:dineronegro')
			 end
			end
		end
	end
end
end)

-- Fin de funciones

-- Inicio de eventos

RegisterNetEvent('dz-itemsbreakdown:progressbar')
AddEventHandler('dz-itemsbreakdown:progressbar', function()
	local _playerid = PlayerPedId() 
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, false)
	ClearPedTasks(_playerid)
	exports['progressBars']:startUI(7500, "El teléfono está siendo reparado...")
	Citizen.Wait(7500)
	ClearPedTasks(_playerid)
end)

-- Fin de eventos

-- Creado por Dizzy
