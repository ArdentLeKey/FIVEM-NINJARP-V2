local blips = {
  {title="Emplois", colour=25, id=480, x=-55.7898, y=6525.02, z=31.4908},
  {title="Emplois", colour=25, id=480, x = -1083.4, y = -245.893, z = 37.7632},
  {title="Boutique de vêtement", colour=76, id=73, x = -163.987, y = -309.924, z = 39.7333},
  {title="Police LSPD", colour=29, id=60, x=450.174, y=-992.276, z=30.6896},
  {title="Hôpital", colour=74, id=61, x=336.293, y=-580.483, z=28.7915},
  {title="Superette", colour=81, id=52, x=29.41, y=-1345.01, z=29.5},
  {title="Superette", colour=81, id=52, x=-48.34, y= -1752.72, z=29.42},
  {title="Superette", colour=81, id=52, x=-1220.78, y=-909.19, z=12.33},
  {title="Superette", colour=81, id=52, x=-1485.59, y=-376.7, z=40.16},
  {title="Superette", colour=81, id=52, x=-711.01, y=-911.25, z=19.22},
  {title="Superette", colour=81, id=52, x=1132.94, y=-983.19, z=46.42},
  {title="Superette", colour=81, id=52, x=378.8, y=329.64, z=103.57},
  {title="Superette", colour=81, id=52, x=1157.88, y=-319.42, z=69.21},
  {title="Superette", colour=81, id=52, x=2552.75, y=386.28, z=108.62},
  {title="Superette", colour=81, id=52, x=-3045.01, y=588.14, z=7.91},
  {title="Superette", colour=81, id=52, x=-3246.45, y=1005.64, z=12.83},
  {title="Superette", colour=81, id=52, x=-2964.96, y=391.33, z=15.04},
  {title="Superette", colour=81, id=52, x=-1827.64, y=793.31, z=138.22},
  {title="Superette", colour=81, id=52, x= 544.43, y=2666.07, z=42.16},
  {title="Superette", colour=81, id=52, x=2676.55, y=3286.27, z=55.24},
  {title="Superette", colour=81, id=52, x=1962.33, y=3746.67, z=32.34},
  {title="Superette", colour=81, id=52, x=1391.23, y=3609.29, z=34.98},
  {title="Superette", colour=81, id=52, x=1705.22, y=4925.39, z=42.06},
  {title="Superette", colour=81, id=52, x=1734.64, y=6417.04, z=35.04},


 --{title="JOB LIVREUR EXEMPLE", colour=81, id=52, x=-615.472, y=-1630.15, z=33.0105},

-- Clubhouses
--{title="Club de bikers", colour=4, id=357, x=973.487, y=-101.972, z=74.850},
--{title="Club de bikers", colour=4, id=357, x=2471.809, y=4110.761, z=38.065},
--{title="Club de bikers", colour=4, id=357, x=-354.032, y=6066.192, z=31.499},

-- Businesses
--{title="IPL Cocaine", colour=66, id=357, x=-246.218, y=-2587.048, z=6.001},
--{title="IPL Document Forgery Office", colour=66, id=440, x=1644.294, y=4857.999, z=41.011},
--{title="IPL Methamphetamine", colour=66, id=499, x=1181.816, y=-3113.832, z=6.028},
--{title="IPL Weed", colour=69, id=496, x=102.446, y=176.030, z=104.716},
}

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

  RequestIpl("v_carshowroom")
  RequestIpl("Carwash_with_spinners")
end)
