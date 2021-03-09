local CurrentActionData         = {}
RMenu.Add('joreseller', 'main', RageUI.CreateMenu("Garage", "Pour sortir un vehicule."))
RMenu.Add('joreseller', 'voiture', RageUI.CreateMenu("Garage", "Sélectionne un Vehicule"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('joreseller', 'main'), true, true, true, function() 
            RageUI.Button("Manchez", nil, {},true, function(Hovered, Active, Selected)
                if (Selected) then
                spawnuniCar("manchez")
                RageUI.CloseAll()
                end
            end)

			RageUI.Button("Futo", nil, {},true, function(Hovered, Active, Selected)
                if (Selected) then
                spawnuniCar("futo")
                RageUI.CloseAll()
                end
            end)
            

            
        end, function()
        end)
    Citizen.Wait(0)
        end
    end)

Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    

    
                local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
                local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z)
                DrawMarker(20, 307.7, -216.86, 57.02+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
            if dist3 <= 3.0 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'reseller' then    
                    ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour accéder au garage")
                    if IsControlJustPressed(1,51) then           
                        RageUI.Visible(RMenu:Get('joreseller', 'main'), not RageUI.Visible(RMenu:Get('joreseller', 'main')))
                    end   
                end
               end 
        end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)



            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.Return.position.x, Config.pos.Return.position.y, Config.pos.Return.position.z)
            DrawMarker(20, 323.71, -202.21 ,53.09+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
        if dist3 <= 3.0 then
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'reseller' then    
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] rentrer votre vehicule")
                if IsControlJustPressed(1,51) then           
                    local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                    if dist4 < 4 then
                        DeleteEntity(veh)
                    end 
                end   
            end
           end 
    end
end)

function spawnuniCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Config.pos.spawnvoiture.position.x, Config.pos.spawnvoiture.position.y, Config.pos.spawnvoiture.position.z, Config.pos.spawnvoiture.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "QUARTIER"..math.random(1,9)
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end


