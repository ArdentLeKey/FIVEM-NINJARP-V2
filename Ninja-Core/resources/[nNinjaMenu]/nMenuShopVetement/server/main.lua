--||@SuperCoolNinja.||--

RegisterServerEvent("nShopVetement:UpdateVetement")
AddEventHandler("nShopVetement:UpdateVetement", 
function(
		Haut_Id,
		Haut_Drawable,
		Haut_Couleur,
		Haut_Palette_Id,
		Maillot_Id,
		Maillot_Drawable,
		Maillot_Couleur,
		Maillot_Palette_Id,
		Chaussure_Id,
		Chaussure_Drawable,
		Chaussure_Couleur,
		Chaussure_Palette_Id,
		Pantalon_Id,
		Pantalon_Drawable,
		Pantalon_Couleur,
		Pantalon_Palette_Id,
		Torso_Id,
		Torso_Drawable,
		Torso_Couleur,
		Torso_Palette_Id
	)

	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local prixVetement = 200 --Price Cloth
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixVetement) then
			MySQL.Async.execute(
			"UPDATE users_vetement SET Haut_Id=@Haut_Id, Haut_Drawable=@Haut_Drawable, Haut_Couleur=@Haut_Couleur, Haut_Palette_Id=@Haut_Palette_Id, Maillot_Id=@Maillot_Id,Maillot_Drawable=@Maillot_Drawable,Maillot_Couleur=@Maillot_Couleur,Maillot_Palette_Id=@Maillot_Palette_Id,Chaussure_Id=@Chaussure_Id,Chaussure_Drawable=@Chaussure_Drawable,Chaussure_Couleur=@Chaussure_Couleur,Chaussure_Palette_Id=@Chaussure_Palette_Id,Pantalon_Id=@Pantalon_Id,Pantalon_Drawable=@Pantalon_Drawable,Pantalon_Couleur=@Pantalon_Couleur,Pantalon_Palette_Id=@Pantalon_Palette_Id,Torso_Id=@Torso_Id,Torso_Drawable=@Torso_Drawable,Torso_Couleur=@Torso_Couleur,Torso_Palette_Id=@Torso_Palette_Id WHERE license=@license", {
			['@license'] = license,
			['@Haut_Id'] = Haut_Id, 
			['@Haut_Drawable'] = Haut_Drawable, 
			['@Haut_Couleur'] = Haut_Couleur, 
			['@Haut_Palette_Id'] = Haut_Palette_Id, 
			['@Maillot_Id'] = Maillot_Id, 
			['@Maillot_Drawable'] = Maillot_Drawable, 
			['@Maillot_Couleur'] = Maillot_Couleur, 
			['@Maillot_Palette_Id'] = Maillot_Palette_Id, 
			['@Chaussure_Id'] = Chaussure_Id, 
			['@Chaussure_Drawable'] = Chaussure_Drawable, 
			['@Chaussure_Couleur'] = Chaussure_Couleur, 
			['@Chaussure_Palette_Id'] = Chaussure_Palette_Id, 
			['@Pantalon_Id'] = Pantalon_Id, 
			['@Pantalon_Drawable'] = Pantalon_Drawable, 
			['@Pantalon_Couleur'] = Pantalon_Couleur, 
			['@Pantalon_Palette_Id'] = Pantalon_Palette_Id, 
			['@Torso_Id'] = Torso_Id, 
			['@Torso_Drawable'] = Torso_Drawable, 
			['@Torso_Couleur'] = Torso_Couleur, 
			['@Torso_Palette_Id'] = Torso_Palette_Id})
			user.removeMoney(prixVetement)
			print("aaa")
		else
			
			TriggerClientEvent("nVetement:LoadOldVetement", source)
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)


RegisterServerEvent("nShopVetement:LoadVetement")
AddEventHandler("nShopVetement:LoadVetement",function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM users_vetement WHERE license=@user",{['@user']=license}, function(result)
		TriggerClientEvent("nShopVetement:C_UpdateVetement", source,
		{
			result[1].Haut_Id,
			result[1].Haut_Drawable,
			result[1].Haut_Couleur,
			result[1].Haut_Palette_Id,
			result[1].Maillot_Id,
			result[1].Maillot_Drawable,
			result[1].Maillot_Couleur,
			result[1].Maillot_Palette_Id,
			result[1].Chaussure_Id,
			result[1].Chaussure_Drawable,
			result[1].Chaussure_Couleur,
			result[1].Chaussure_Palette_Id,
			result[1].Pantalon_Id,
			result[1].Pantalon_Drawable,
			result[1].Pantalon_Couleur,
			result[1].Pantalon_Palette_Id,
			result[1].Torso_Id,
			result[1].Torso_Drawable,
			result[1].Torso_Couleur,
			result[1].Torso_Palette_Id
		})
	end)
end)