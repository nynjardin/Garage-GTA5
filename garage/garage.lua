local plyPed = GetPlayerPed(-1)
local plyVeh = (GetVehiclePedIsUsing(GetPlayerPed(-1)))

-----------------------------------------------------------------------
----------------------------GARAGE-LOCATION----------------------------
-----------------------------------------------------------------------

vehicleRepairStation = {
	{1183.89, -334.16, 68.41},
	{-2100.31, -312.37, 12.26},
	{176.20, 6605.06, 31.08},
	{2584.26, 358.81, 107.69},
	{2007.83, 3776, 32.40},
	{-728.12, -934.32, 18.25}
	}


function DrawSpecialText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
	Citizen.Wait(0)
		for i = 1, 6 do
			local garageCoords = vehicleRepairStation[i]
			stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
			DrawMarker(1, garageCoords[1], garageCoords[2], garageCoords[3], 0, 0, 0, 0, 0, 0, 20.0, 20.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)

			SetBlipSprite(stationBlip, 446) --446 = Tools

			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords[1], garageCoords[2], garageCoords[3], true ) < 20 then 
					SetVehicleFixed(GetVehiclePedIsUsing(GetPlayerPed(-1)))
					SetVehicleDeformationFixed(GetVehiclePedIsUsing(GetPlayerPed(-1)))
					SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
					DrawSpecialText("Vehicle ~h~~y~fixed~w~!!! Go! Go! Go!", 5000)
				end
			end
		end
	end
	

end)
