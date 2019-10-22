nConfig = {}

nConfig.nDistanceMarker = 100.0
nConfig.nDistancePlayer = 3.0


nConfig.RemoveCarPos = {
    lRemoveGaragePolice = {
        Pos   = {x = 451.999, y = -997.16, z = 25.7613},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 255, g = 0, b = 0 },  
        Type  = 25,
    },
}

nConfig.Armurie = {
    lArmureriePolice = {
        Pos   = {x = 452.372, y = -980.519, z = 30.6896},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 0, b = 180 },  
        Type  = 25,
    },
}

nConfig.Vestiaire = {
    lVestiairePolice = {
        Pos   = {x = 450.174, y = -992.276, z = 30.6896},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 0, b = 180 },  
        Type  = 25,
    },
}

nConfig.Garage = {
    lGaragePolice = {
        Pos   = {x = 442.283, y = -1014.85, z = 28.6427},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 0, b = 180 },  
        Type  = 25,
    },
}

nConfig.Prison = {
    lPrisonPolice = {
        Pos   = {x = 462.158, y = -989.766, z = 24.9149},
        Pos   = {x = 1830.43, y = 2602.64, z = 45.8891},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 0, b = 180 },  
        Type  = 25,
    },
}

nConfig.Vehicles = {
    {Label = "Police Cruiser",              Hash = "police"},
    {Label = "Buffalo de police",           Hash = "police2"},
    {Label = "Interceptor",                 Hash = "police3"},
    {Label = "Police banalisée",            Hash = "police4"},
    {Label = "Fourgon de transport",        Hash = "policet"},
}

nConfig.Armes = {
    {Label = "Tazer",              Hash = "WEAPON_STUNGUN"},
    {Label = "Matraque",           Hash = "WEAPON_NIGHTSTICK"},
    {Label = "Lampe de poche",                 Hash = "WEAPON_FLASHLIGHT"},
    {Label = "Fusil a pompe",            Hash = "WEAPON_PUMPSHOTGUN"},
    {Label = "Pistolet",        Hash = "WEAPON_PISTOL50"},
    {Label = "Fumigène",              Hash = "WEAPON_SMOKEGRENADE"},
    {Label = "Sniper",           Hash = "WEAPON_HEAVYSNIPER"},
    {Label = "SMG",                 Hash = "WEAPON_ASSAULTSMG"},
}

Config = { 
    Locations = {
        [1] = { --GOOD
            ["myPedsLocation"] = {
                ["x"] = 454.143, ["y"] = -980.163, ["z"] =30.6896, ["h"] = 100.0,
                ["hash"] = "s_m_y_cop_01"
            },
        },

        [2] = { --GOOD
            ["myPedsLocation"] = {
                ["x"] = 442.283, ["y"] = -1014.85, ["z"] =28.6427, ["h"] = 180.0,
                ["hash"] = "s_f_y_cop_01"
            },
        },

        [3] = { --GOOD
            ["myPedsLocation"] = {
                ["x"] = 441.165, ["y"] = -978.869, ["z"] =30.6896, ["h"] = 180.0,
                ["hash"] = "s_f_y_cop_01"
            },
        },
    },
}