ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('deltazz-blanchiment:blanchiment')
AddEventHandler('deltazz-blanchiment:blanchiment', function(argent)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local taxe = Config.Info.Tax.taxe 

	argent = ESX.Math.Round(tonumber(argent))
	pourcentage = argent * taxe
	Total = ESX.Math.Round(tonumber(pourcentage))

	if argent > 0 and xPlayer.getAccount('black_money').money >= argent then
		xPlayer.removeAccountMoney('black_money', argent)
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Information', 'Blanchiment', 'Ok je te fais ça !', 'CHAR_LESTER_DEATHWISH', 8)
		Citizen.Wait(10000)
		
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Information', 'Blanchiment', 'Vous avez reçu : ' .. ESX.Math.GroupDigits(Total) .. ' ~g~$ de Wilson', 'CHAR_LESTER_DEATHWISH', 8)
		xPlayer.addMoney(Total)
	else
		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Information', 'Blanchiment', '~r~Montant invalide', 'CHAR_LESTER_DEATHWISH', 8)
	end	
end)
