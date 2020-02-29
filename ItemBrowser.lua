ItemBrowser = {
    name = "ItemBrowser",
    slashCommand = "/itembrowser",

    sortType = 1,

    colors = {
        health  = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_HEALTH)),
        magicka = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_MAGICKA)),
        stamina = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_STAMINA)),
        violet  = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_QUALITY_COLORS, ITEM_QUALITY_ARTIFACT)),
        gold    = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_QUALITY_COLORS, ITEM_QUALITY_LEGENDARY)),
        brown   = ZO_ColorDef:New("885533"),
        teal    = ZO_ColorDef:New("66CCCC"),
        pink    = ZO_ColorDef:New("FF99CC"),
    },
}

function ItemBrowser.OnAddOnLoaded( eventCode, addonName )
    if (addonName ~= ItemBrowser.name) then return end

    EVENT_MANAGER:UnregisterForEvent(ItemBrowser.name, EVENT_ADD_ON_LOADED)

    SLASH_COMMANDS[ItemBrowser.slashCommand] = ItemBrowser.HandleSlashCommand

    ZO_CreateStringId("SI_BINDING_NAME_ITEMBROWSER", GetString(SI_ITEMBROWSER_TITLE))

    local allianceStyles = {
        [ALLIANCE_NONE]                = ITEMSTYLE_NONE,
        [ALLIANCE_ALDMERI_DOMINION]    = ITEMSTYLE_ALLIANCE_ALDMERI,
        [ALLIANCE_EBONHEART_PACT]      = ITEMSTYLE_ALLIANCE_EBONHEART,
        [ALLIANCE_DAGGERFALL_COVENANT] = ITEMSTYLE_ALLIANCE_DAGGERFALL,
    }

    ItemBrowser.allianceStyle = allianceStyles[GetUnitAlliance("player")]

    ItemBrowser.multiStyle = GetUnitRaceId("player")
    if (ItemBrowser.multiStyle == 10) then ItemBrowser.multiStyle = ITEMSTYLE_RACIAL_IMPERIAL end
end

function ItemBrowser.HandleSlashCommand( command )
    ItemBrowser.Toggle()
end

function ItemBrowser.Toggle( )
    if (not ItemBrowser.list) then
        -- Lazy initialization
        ItemBrowser.list = ItemBrowserList:New(ItemBrowserFrame)
    end

    if (ItemBrowserFrame:IsControlHidden()) then
        SCENE_MANAGER:Show("ItemBrowserScene")
    else
        SCENE_MANAGER:Hide("ItemBrowserScene")
    end
end

function ItemBrowser.AddToChat( message )
    StartChatInput(CHAT_SYSTEM.textEntry:GetText() .. message)
end

function ItemBrowser.CheckFlag( flags, flagToCheck )
    -- Lua is a scrub language with no native bitwise operators
    return(math.floor(flags / flagToCheck) % 2 == 1)
end

function ItemBrowser.GetZoneNameById( zoneId )
    if (zoneId < -100) then
        return(ItemBrowserData.specialNames[zoneId])
    elseif (zoneId < 0) then
        return(GetString("SI_ITEMBROWSER_SOURCE_SPECIAL", zoneId * -1))
    else
        return(LocalizeString("<<C:1>>", GetZoneNameByIndex(GetZoneIndex(zoneId))))
    end
end

function ItemBrowser.MakeItemLink( id, flags, ext )
    local quality = 364
    local crafted = 0
    local health = 10000

    if (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.crafted)) then
        quality = 370
        crafted = 1
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.jewelry)) then
        health = 0
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.weapon)) then
        health = 500
    end

    local style = ITEMSTYLE_NONE

    if (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.allianceStyle)) then
        style = ItemBrowser.allianceStyle
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.multiStyle)) then
        style = ItemBrowser.multiStyle
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.manualStyle)) then
        style = ext
    end

    local itemLink = string.format("|H1:item:%d:%d:50:0:0:0:0:0:0:0:0:0:0:0:0:%d:%d:0:0:%d:0|h|h", id, quality, style, crafted, health)

    if (crafted == 1) then
        -- Attach an enchantment to crafted gear

        local enchantments = {
            [ARMORTYPE_NONE]   = 0,
            [ARMORTYPE_HEAVY]  = 26580,
            [ARMORTYPE_LIGHT]  = 26582,
            [ARMORTYPE_MEDIUM] = 26588,
        }

        itemLink = itemLink:gsub("370:50:0:0:0", string.format("370:50:%d:370:50", enchantments[GetItemLinkArmorType(itemLink)]))
    end

    return(itemLink)
end

function ItemBrowser.GetSetBonuses( itemLink, numBonuses )
    local bonuses, description

    bonuses = { }
    for i = 1, numBonuses do
        _, description = GetItemLinkSetBonusInfo(itemLink, false, i)
        table.insert(bonuses, description)
    end

    return(bonuses)
end

function ItemBrowser.CreateEntryFromRaw( rawEntry )
    local id = rawEntry[1]
    local flags = rawEntry[2]

    local itemLink = ItemBrowser.MakeItemLink(id, flags, rawEntry[4])
    local name, subname, itemType, color, bonuses
    local zoneType = { }

    _, name, bonuses = GetItemLinkSetInfo(itemLink)
    name = LocalizeString("<<C:1>>", name)
    subname = ""

    if (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.crafted)) then
        itemType = string.format("%s (%d)", GetString(SI_ITEMBROWSER_TYPE_CRAFTED), rawEntry[4])
        color = ItemBrowser.colors.pink
        zoneType[0] = true
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.jewelry)) then
        itemType = GetString("SI_GAMEPADITEMCATEGORY", GAMEPAD_ITEM_CATEGORY_JEWELRY)
        color = ItemBrowser.colors.violet
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.monster)) then
        itemType = GetString(SI_ITEMBROWSER_TYPE_MONSTER)
        color = ItemBrowser.colors.brown
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.weapon)) then
        subname = LocalizeString("<<t:1>>", GetItemLinkName(itemLink))
        itemType = LocalizeString("<<C:1>>", GetString("SI_ITEMTYPE", ITEMTYPE_WEAPON))
        color = ItemBrowser.colors.gold
    elseif (ItemBrowser.CheckFlag(flags, ItemBrowserData.flags.mixedWeights)) then
        itemType = GetString(SI_ITEMBROWSER_TYPE_MIXED)
        color = ItemBrowser.colors.teal
    else
        armorType = GetItemLinkArmorType(itemLink)

        local armorColors = {
            [ARMORTYPE_NONE]   = ZO_DEFAULT_TEXT,
            [ARMORTYPE_HEAVY]  = ItemBrowser.colors.health,
            [ARMORTYPE_LIGHT]  = ItemBrowser.colors.magicka,
            [ARMORTYPE_MEDIUM] = ItemBrowser.colors.stamina,
        }

        itemType = LocalizeString("<<C:1>>", GetString("SI_ARMORTYPE", armorType))
        color = armorColors[armorType]
    end

    local source = ""

    for i = 1, #rawEntry[3] do
        if (type(rawEntry[3][i]) == "number") then
            if (i > 1) then source = source .. ", " end
            source = source .. ItemBrowser.GetZoneNameById(rawEntry[3][i])
            zoneType[ItemBrowserData.zoneClassification[rawEntry[3][i]]] = true
        elseif (type(rawEntry[3][i]) == "table") then
            source = source .. " ("
            for j = 1, #rawEntry[3][i] do
                if (j > 1) then source = source .. ", " end
                source = source .. ItemBrowser.GetZoneNameById(rawEntry[3][i][j])
            end
            source = source .. ")"
        end
    end

    zoneType[(GetItemLinkBindType(itemLink) == BIND_TYPE_ON_EQUIP) and 5 or 6] = true

    return({
        type = ItemBrowser.sortType,
        name = name,
        subname = subname,
        itemType = itemType,
        source = source,
        zoneType = zoneType,
        color = color,
        bonuses = bonuses,
        itemLink = itemLink,
    })
end

EVENT_MANAGER:RegisterForEvent(ItemBrowser.name, EVENT_ADD_ON_LOADED, ItemBrowser.OnAddOnLoaded)
