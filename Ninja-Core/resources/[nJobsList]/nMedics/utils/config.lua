nConfig = {}

nConfig.nDistanceMarker = 100.0
nConfig.nDistancePlayer = 3.0


nConfig.RemoveCarPos = {
    lRemoveGarageMedics = {
        Pos   = {x = 339.712, y = -561.893, z = 28.7434},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 255, g = 0, b = 0 },  
        Type  = 25,
    },
}

nConfig.RemoveHeliPos = {
    lRemoveGarageMedics = {
        Pos   = {x = 351.28, y = -587.669, z = 74.1657},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 255, g = 0, b = 0 },  
        Type  = 25,
    },
}


nConfig.Armurie = {
    lArmurerieMedics = {
        Pos   = {x = 452.372, y = -980.519, z = 30.6896},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 0, b = 180 },  
        Type  = 25,
    },
}

nConfig.Vestiaire = {
    lVestiaireMedics = {
        Pos   = {x = 336.293, y = -580.483, z = 28.7915},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 180, b = 0 },  
        Type  = 25,
    },
}

nConfig.Garage = {
    lGarageMedics = {
        Pos   = {x = 330.477, y = -558.755, z = 28.7434},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 180, b = 0 },  
        Type  = 25,
    },
}

nConfig.GarageHeli = {
    lGarageHelicoMedics = {
        Pos   = {x = 361.765, y = -592.119, z = 74.1656},
        Size  = { x = 2.1, y = 2.1, z = 1 },
        Color = { r = 0, g = 180, b = 0 },  
        Type  = 25,
    },
}

nConfig.Vehicles = {
    {Label = "Ambulance",              Hash = "Ambulance"},
}

nConfig.VehiclesHelico = {
    {Label = "Hélicoptère de service",              Hash = "buzzard2"},
}


nConfig.Armes = {
    {Label = "Lampe de poche",                 Hash = "WEAPON_FLASHLIGHT"},
    {Label = "Extincteur",                 Hash = "WEAPON_FireExtinguisher"},
}

Config = { 
    Locations = {
        [1] = { --GOOD
            ["myPedsLocation"] = {--NPC GARAGE
                ["x"] = 330.477, ["y"] = -558.755, ["z"] =28.7434, ["h"] = 0.0,
                ["hash"] = "s_m_m_paramedic_01"
            },
        },

        [2] = { --GOOD
            ["myPedsLocation"] = { --NPC HELICO
                ["x"] = 361.765, ["y"] = -592.119, ["z"] =74.1656, ["h"] = 55.0,
                ["hash"] = "s_m_m_paramedic_01"
            },
        },

        [3] = { --GOOD
        ["myPedsLocation"] = { --NPC HELICO
            ["x"] = 339.627, ["y"] = -581.402, ["z"] =28.7915, ["h"] = -105.0,
            ["hash"] = "s_m_m_paramedic_01"
        },
    },
    },
}