key_to_teleport = 38

positions = {
	-- Clubhouses
 	{{2471.757, 4110.815, 36.500, 66.281}, {997.256, -3158.109, -40.500, 268.836}, "Press E to Teleport | Grapeseed Biker Clubhouse"},
 	{{2466.457, 4101.402, 36.800, 81.567}, {998.828, -3164.342, -40.150, 266.851}, "Press E to Teleport | Grapeseed Biker Clubhouse Garage"},
 	{{-355.334, 6067.529, 30.300, 45.678}, {1110.144, -3164.258, -38.750, 356.001}, "Press E to Teleport | Paleto Bay Biker Clubhouse Garage"},
	-- Warehouses
	{{-253.018, -2591.167, 4.500, 80.300}, {1088.666, -3187.666, -40.500, 177.669}, "Press E to Teleport | Cocaine Warehouse"},
	{{-235.385, -2574.540, 3.500, 357.135}, {1103.323, -3195.890, -40.500, 89.395}, "Press E to Teleport | Cocaine Warehouse Garage"},
	{{1644.294, 4857.999, 40.500, 94.641}, {1173.509, -3196.669, -40.500, 88.377}, "Press E to Teleport | Document Forgery Office"},
	{{1181.454, -3113.752, 4.500, 85.741}, {997.097, -3200.712, -37.450, 274.344}, "Press E to Teleport | Methamphetamine Lab"},
	{{102.171, 175.514, 103.100, 168.486}, {1066.010, -3183.380, -40.700, 93.012}, "Press E to Teleport | Weed Farm"},
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for i,location in ipairs(positions) do
            teleport_text = location[3]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end