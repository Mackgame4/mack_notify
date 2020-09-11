RegisterNetEvent('mack_notify:client:SendAlert')
AddEventHandler('mack_notify:client:SendAlert', function(data)
	DoCustomHudText(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mack_notify:client:PersistentHudText')
AddEventHandler('mack_notify:client:PersistentHudText', function(data)
	PersistentHudText(data.action, data.id, data.type, data.text, data.style)
end)

function DoShortHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 1000,
		style = style
	})
end

function DoHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 2500,
		style = style
	})
end

function DoLongHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 5000,
		style = style
	})
end

function DoCustomHudText(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end

function PersistentHudText(action, id, type, text, style)
	if action:upper() == 'START' then
		SendNUIMessage({
			persist = action,
			id = id,
			type = type,
			text = text,
			style = style
		})
	elseif action:upper() == 'END' then
		SendNUIMessage({
			persist = action,
			id = id
		})
	end
end

RegisterCommand("notify", function(source , args, rawCommand)
	exports['mack_notify']:DoHudText('error', 'message error ')
	exports['mack_notify']:DoHudText('inform', 'message inform')
	exports['mack_notify']:DoHudText('success', 'success message')
	exports['mack_notify']:DoHudText('warning', 'warning message')
	exports['mack_notify']:DoHudText('success', 'Success: '..'message')
end)