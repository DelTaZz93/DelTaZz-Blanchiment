Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

local mainMenu = RageUI.CreateMenu("Blanchiment", "FAIS VITE !!")

function OpenMenu()
     if open then 
         open = false
         RageUI.Visible(mainMenu, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu, true)
         CreateThread(function()
         while open do 


            RageUI.IsVisible(mainMenu,function() 

                RageUI.Separator("~h~↓  ~g~Wilson~s~  ↓")

				RageUI.Button("Blanchir de l'argent sale", "Wilson prendra ~r~50% de ton blanchiment !", {RightLabel = "→→"}, true , {
					onSelected = function()
						local argent = KeyboardInput("Combien avez-vous ?", '' , '', 8)
						TriggerServerEvent('deltazz-blanchiment:blanchiment', argent)	
					end
				})

            end)
          Wait(0)
         end
      end)
   end
end

Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _,v in pairs(Config.Info.Pos) do
            local playerPos = GetEntityCoords(PlayerPedId())
            local dst = #(playerPos - v)
            if dst <= 5.0 then
                interval = 0
                if dst <= 2.0 then
                    Visual.Subtitle("Appuyer sur ~g~[E]~s~ pour parler avec ~g~Wilson", 0)
                    if IsControlJustPressed(0, 51) then
                        OpenMenu()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_beach_03")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_beach_03", 1016.91, -2383.22, 29.5, 256.55, false, true) 
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_beach_03")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_beach_03", 596.01, -457.21, 24.74, 352.03, false, true) 
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end)