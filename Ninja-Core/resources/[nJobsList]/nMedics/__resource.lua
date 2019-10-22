resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


client_scripts {
    "dependency/Wrapper/Utility.lua",

    "dependency/UIElements/UIVisual.lua",
    "dependency/UIElements/UIResRectangle.lua",
    "dependency/UIElements/UIResText.lua",
    "dependency/UIElements/Sprite.lua",
}

client_scripts {
    "dependency/UIMenu/elements/Badge.lua",
    "dependency/UIMenu/elements/Colours.lua",
    "dependency/UIMenu/elements/ColoursPanel.lua",
    "dependency/UIMenu/elements/StringMeasurer.lua",

    "dependency/UIMenu/items/UIMenuItem.lua",
    "dependency/UIMenu/items/UIMenuCheckboxItem.lua",
    "dependency/UIMenu/items/UIMenuListItem.lua",
    "dependency/UIMenu/items/UIMenuSliderItem.lua",
    "dependency/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "dependency/UIMenu/items/UIMenuColouredItem.lua",

    "dependency/UIMenu/items/UIMenuProgressItem.lua",
    "dependency/UIMenu/items/UIMenuSliderProgressItem.lua",

    "dependency/UIMenu/windows/UIMenuHeritageWindow.lua",

    "dependency/UIMenu/panels/UIMenuGridPanel.lua",
    "dependency/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "dependency/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "dependency/UIMenu/panels/UIMenuColourPanel.lua",
    "dependency/UIMenu/panels/UIMenuPercentagePanel.lua",
    "dependency/UIMenu/panels/UIMenuStatisticsPanel.lua",

    "dependency/UIMenu/UIMenu.lua",
    "dependency/UIMenu/MenuPool.lua",
}

client_scripts {
    'dependency/UITimerBar/UITimerBarPool.lua',

    'dependency/UITimerBar/items/UITimerBarItem.lua',
    'dependency/UITimerBar/items/UITimerBarProgressItem.lua',
    'dependency/UITimerBar/items/UITimerBarProgressWithIconItem.lua',

}

client_scripts {
    'dependency/UIProgressBar/UIProgressBarPool.lua',
    'dependency/UIProgressBar/items/UIProgressBarItem.lua',
}

client_scripts {
    "dependency/NativeUI.lua",
}

client_scripts {
    'utils/config.lua',
    'utils/peds.lua',
    'client/medic_main.lua',
    'client/medic_vestiaire.lua',
    'client/medic_inventaire.lua',
    'client/medic_garage.lua',
    'client/medic_garageHelico.lua'
  }

  server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'utils/config.lua',
    'server.lua'
  }