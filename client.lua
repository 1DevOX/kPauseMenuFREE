local opened = false
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		SetPauseMenuActive(false)
	end
end)

local wasmenuopen = false
local activate = false

--functions
function SetDisplay(bool)
	SetNuiFocus(bool, bool)
	SetNuiFocusKeepInput(false)
	DisableIdleCamera(bool)
	SetCursorLocation(0.5, 0.5)

	SendNUIMessage({
        type = "ui",
        status = bool,
    });
end

function close()
	SetDisplay(false)
    opened = false
end

--callback
RegisterNUICallback("close", function(data)
    close()
end)

RegisterNUICallback("quit", function(data)
    close()
	RestartGame()
end)

RegisterNUICallback("map", function(data)
    close()
	
			ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, -1)
		end)

RegisterNUICallback("settings", function(data)
    close()
	ActivateFrontendMenu('FE_MENU_VERSION_LANDING_MENU',0, 1)
end)

--commands
RegisterCommand('closepause', function ()
	ExecuteCommand('EmoteCancel')
	SetDisplay(false)
end)

RegisterKeyMapping("openesc", "Menu Pause", "keyboard", "ESCAPE")

RegisterCommand('openesc', function () --950
	--local menus = ESX.UI.Menu.GetOpenedMenus()
	if not IsPauseMenuActive() and not IsNuiFocused() then
	--	if next(menus) == nil then
		SetDisplay(true)
	end
	--end
	activate = true
	Citizen.CreateThread(function() 
		while activate do 
			if IsPauseMenuActive() and not wasmenuopen then
				SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true) -- set unarmed
				wasmenuopen = true
			end
			if not IsPauseMenuActive() and wasmenuopen then
				Wait(500)
				wasmenuopen = false
				activate = false
			end
			Wait(10)
		end
	end)
end)