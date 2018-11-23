SandE = {}

local SandE = SandE

SandE.name = "SandE"
SandE.version = 0.2
SandE.displayName = ""
SandE.displayName = SandE.displayName .. "|cffffff" .. "S" .. "|r"
SandE.displayName = SandE.displayName .. "|ccccccc" .. "t" .. "|r"
SandE.displayName = SandE.displayName .. "|caaaaaa" .. "y" .. "|r"
SandE.displayName = SandE.displayName .. "|c888888" .. "l" .. "|r"
SandE.displayName = SandE.displayName .. "|c666666" .. "e" .. "|r"
SandE.displayName = SandE.displayName .. "|cffffff" .. " " .. "|r"
SandE.displayName = SandE.displayName .. "|c333333" .. "a" .. "|r"
SandE.displayName = SandE.displayName .. "|c333333" .. "n" .. "|r"
SandE.displayName = SandE.displayName .. "|c333333" .. "d" .. "|r"
SandE.displayName = SandE.displayName .. "|cffffff" .. " " .. "|r"
SandE.displayName = SandE.displayName .. "|c666666" .. "E" .. "|r"
SandE.displayName = SandE.displayName .. "|c777777" .. "l" .. "|r"
SandE.displayName = SandE.displayName .. "|c888888" .. "e" .. "|r"
SandE.displayName = SandE.displayName .. "|c999999" .. "g" .. "|r"
SandE.displayName = SandE.displayName .. "|cbbbbbb" .. "a" .. "|r"
SandE.displayName = SandE.displayName .. "|cdddddd" .. "n" .. "|r"
SandE.displayName = SandE.displayName .. "|ceeeeee" .. "c" .. "|r"
SandE.displayName = SandE.displayName .. "|cffffff" .. "e" .. "|r"

SandE.CURRENT = "Current"
SandE.USER = "User"

SandE.configTypes = {
    SandE.CURRENT,
    SandE.USER,
}

SandE.currentCurrent = nil
SandE.currentSlot = nil
SandE.currentIndex = -1
SandE.disableUpdates = false
SandE.bindingStartingIndex = -1

SandE.NEW = "+  - New - +"

SandE.COLLECTIBLES = {
    COLLECTIBLE_CATEGORY_TYPE_MOUNT             ,
    COLLECTIBLE_CATEGORY_TYPE_VANITY_PET        ,
    COLLECTIBLE_CATEGORY_TYPE_COSTUME           ,
    COLLECTIBLE_CATEGORY_TYPE_PERSONALITY       ,
    COLLECTIBLE_CATEGORY_TYPE_HAT               ,
    COLLECTIBLE_CATEGORY_TYPE_SKIN              ,
    COLLECTIBLE_CATEGORY_TYPE_POLYMORPH         ,
    COLLECTIBLE_CATEGORY_TYPE_HAIR              ,
    COLLECTIBLE_CATEGORY_TYPE_FACIAL_HAIR_HORNS ,
    COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY  ,
    COLLECTIBLE_CATEGORY_TYPE_PIERCING_JEWELRY  ,
    COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING      ,
    COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING      ,
}

SandE.COLLECTIBLE_STRINGS = {
    [COLLECTIBLE_CATEGORY_TYPE_VANITY_PET       ] = "|cff0000Vanity Pet|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_COSTUME          ] = "|cffaa00Costume|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_PERSONALITY      ] = "|cffff00Personality|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_HAT              ] = "|caaff00Hat|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_SKIN             ] = "|c00ff00Skin|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_POLYMORPH        ] = "|c00ffaaPolymorph|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_HAIR             ] = "|c00ffffHair|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_HAIR_HORNS] = "|c00aaffFacial Hair or Horns|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY ] = "|c0000ffFacial Accessory|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_PIERCING_JEWELRY ] = "|caa00ffJewelery|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING     ] = "|cff00ffHead Marking|r" ,
    [COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING     ] = "|cff00aaBody Marking|r" ,
}

SandE.UIItems = {
    [COLLECTIBLE_CATEGORY_TYPE_MOUNT            ] = { SandEWindow_Item_2_Icon , SandEWindow_Item_2_Label , SandEWindow_Item_2 , },
    [COLLECTIBLE_CATEGORY_TYPE_VANITY_PET       ] = { SandEWindow_Item_3_Icon , SandEWindow_Item_3_Label , SandEWindow_Item_3 , },
    [COLLECTIBLE_CATEGORY_TYPE_COSTUME          ] = { SandEWindow_Item_4_Icon , SandEWindow_Item_4_Label , SandEWindow_Item_4 , },
    [COLLECTIBLE_CATEGORY_TYPE_PERSONALITY      ] = { SandEWindow_Item_9_Icon , SandEWindow_Item_9_Label , SandEWindow_Item_9 , },
    [COLLECTIBLE_CATEGORY_TYPE_HAT              ] = { SandEWindow_Item_10_Icon, SandEWindow_Item_10_Label, SandEWindow_Item_10, },
    [COLLECTIBLE_CATEGORY_TYPE_SKIN             ] = { SandEWindow_Item_11_Icon, SandEWindow_Item_11_Label, SandEWindow_Item_11, },
    [COLLECTIBLE_CATEGORY_TYPE_POLYMORPH        ] = { SandEWindow_Item_12_Icon, SandEWindow_Item_12_Label, SandEWindow_Item_12, },
    [COLLECTIBLE_CATEGORY_TYPE_HAIR             ] = { SandEWindow_Item_13_Icon, SandEWindow_Item_13_Label, SandEWindow_Item_13, },
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_HAIR_HORNS] = { SandEWindow_Item_14_Icon, SandEWindow_Item_14_Label, SandEWindow_Item_14, },
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY ] = { SandEWindow_Item_15_Icon, SandEWindow_Item_15_Label, SandEWindow_Item_15, },
    [COLLECTIBLE_CATEGORY_TYPE_PIERCING_JEWELRY ] = { SandEWindow_Item_16_Icon, SandEWindow_Item_16_Label, SandEWindow_Item_16, },
    [COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING     ] = { SandEWindow_Item_17_Icon, SandEWindow_Item_17_Label, SandEWindow_Item_17, },
    [COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING     ] = { SandEWindow_Item_18_Icon, SandEWindow_Item_18_Label, SandEWindow_Item_18, },
}

SandE.Template = {
    [COLLECTIBLE_CATEGORY_TYPE_MOUNT            ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_VANITY_PET       ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_COSTUME          ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_PERSONALITY      ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_HAT              ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_SKIN             ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_POLYMORPH        ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_HAIR             ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_HAIR_HORNS] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_PIERCING_JEWELRY ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING     ] = 0,
    [COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING     ] = 0,
}

SandE.BINDING_NAMES = {
    "SI_BINDING_NAME_SANDE_BIND1",
    "SI_BINDING_NAME_SANDE_BIND2",
    "SI_BINDING_NAME_SANDE_BIND3",
    "SI_BINDING_NAME_SANDE_BIND4",
    "SI_BINDING_NAME_SANDE_BIND5",
    "SI_BINDING_NAME_SANDE_BIND6",
    "SI_BINDING_NAME_SANDE_BIND7",
    "SI_BINDING_NAME_SANDE_BIND8",
    "SI_BINDING_NAME_SANDE_BIND9",
    "SI_BINDING_NAME_SANDE_BIND10",
    "SI_BINDING_NAME_SANDE_BIND11",
    "SI_BINDING_NAME_SANDE_BIND12",
}

SandE.BINDING_IDS = { }

SandE.Defaults = {}
SandE.Defaults.User = {}
SandE.Defaults.UserOutfit = {}
SandE.Defaults.UserMap = {}
SandE.Defaults.userCount = 0
SandE.Defaults.ui = {}
SandE.Defaults.ui.point = 3
SandE.Defaults.ui.relPoint = 3
SandE.Defaults.ui.offsetX = 406.68145751953
SandE.Defaults.ui.offsetY = 194.69073486328
SandE.Defaults.ui.buttonX = 0
SandE.Defaults.ui.buttonY = 0
SandE.Defaults.ui.showIcon = true
SandE.Defaults.ui.autoShow = true

local function createSettings()
    local LAM = LibStub("LibAddonMenu-2.0")

    local settingsWindowData = {
        type = "panel",
        name = SandE.displayName,
        author = "|caaffeFJodynn|r",
        version = tostring(SandE.version),
        slashCommand = "/outfitsettings"
    }

    local settingsOptionsData = {
        {
            type = "checkbox",
            name = "Auto show/hide",
            tooltip = "When you open the Collection book choose to auto show/hide when it leaves",
            default = SandE.Defaults.ui.autoShow,
            getFunc = function() return SandE.sv.ui.autoShow end,
            setFunc = function(newValue)
                SandE.sv.ui.autoShow = newValue
            end,
        },
        {
            type = "checkbox",
            name = "Show image button to open SandE's UI.",
            tooltip = "Toggles whether or not you want to show the icon that tells you the keybinding and a button to open the UI and move around.",
            default = SandE.sv.ui.showIcon,
            getFunc = function() return SandE.sv.ui.showIcon end,
            setFunc = function(newValue)
                SandE.sv.ui.showIcon = newValue
                Outfit_UI_ButtonBg:SetHidden(not newValue)
                Outfit_UI_Button:SetHidden(not newValue)
                Outfit_UI_ButtonLabel:SetHidden(not newValue)
            end,
        },
    }

    local settingsOptionPanel = LAM:RegisterAddonPanel(SandE.name.."_LAM", settingsWindowData)
    LAM:RegisterOptionControls(SandE.name.."_LAM", settingsOptionsData)
end

function toggleSandEUI()
    SandEWindow:SetHidden(not SandEWindow:IsHidden())
end

function selectSandEKeyBinding(bind)
    -- if we don't have one yet lol
    if SandE.sv.userCount < bind then
        return
    end

    SandE.currentIndex = bind
    SandE.currentSlot = SandE.sv.User[SandE.currentIndex]

    SandE:Load()

    -- o_comboBox2:SetHidden(true)

    -- SandE.currentType = SandE.CURRENT
    -- SandE.currentSlot = SandE.currentCurrent
    -- SandE:UpdateUI()

    -- this theo should work
    -- SandE.mainComboBox:UpdateItems()
    SandE.mainComboBox:SelectFirstItem()
end

function SandE:Open()
    SandEWindow:SetHidden(false)
end

function SandE:Close()
    SandEWindow:SetHidden(true)
end

function SandE:reloadComboBox2()
    SandE.comboBox2:ClearItems()

    local itemEntry = SandE.comboBox2:CreateItemEntry(SandE.NEW, OutfitSelectCallback)
    SandE.comboBox2:AddItem(itemEntry, ZO_COMBOBOX_SURPRESS_UPDATE)

    for i, name in pairs(SandE.sv.User) do
        local entryName = SandE:getEntryName(i, SandE.sv.UserMap[i])
        itemEntry = SandE.comboBox2:CreateItemEntry(entryName, OutfitSelectCallback)
        SandE.comboBox2:AddItem(itemEntry, ZO_COMBOBOX_SURPRESS_UPDATE)
        -- ZO_CreateStringId(SandE.BINDING_NAMES[i], entryName)
        EsoStrings[SandE.bindingStartingIndex + i - 1] = entryName
    end

    for i=SandE.sv.userCount + 1, #SandE.BINDING_NAMES do
        EsoStrings[SandE.bindingStartingIndex + i - 1] = "NO OUTFIT MADE YET : " .. tostring(i)
    end

    KEYBINDING_MANAGER:RefreshList()
end

function SandE:GetOutfitName(i)
    if i == 0 then
        return "No Outfit"
    else
        return GetOutfitName(i)
    end
end

function SandE:RenameUser(text)
    if text == nil or text == '' then
        return
    end

    SandE.sv.UserMap[SandE.currentIndex] = text

    SandE:reloadComboBox2()

    local entryName = SandE:getEntryName(SandE.currentIndex, text)
    SandE.comboBox2:SetSelectedItem(entryName)

    SandEWindowRenameEditBoxBackdropEditBox:SetText("Rename")
    SandEWindowRenameEditBoxBackdropEditBox:SetColor(.7,.7,.5,.5)
end

function SandE:Delete()
    table.remove(SandE.sv.User, SandE.currentIndex)
    table.remove(SandE.sv.UserOutfit, SandE.currentIndex)
    table.remove(SandE.sv.UserMap, SandE.currentIndex)

    SandE.sv.userCount = SandE.sv.userCount - 1

    SandE.mainComboBox:UpdateItems()
    SandE.mainComboBox:SelectFirstItem()

    SandE:reloadComboBox2()
end

function SandE:Save()
    for i, id in pairs(SandE.currentCurrent) do
        SandE.currentSlot[i] = id
    end

    SandE.sv.UserOutfit[SandE.currentIndex] = GetEquippedOutfitIndex() or 0

    SandE:UpdateUI()
end

function SandE:Load()
    SandE.disableUpdates = true

    for i, id in pairs(SandE.currentSlot) do
        if id == 0 and i ~= COLLECTIBLE_CATEGORY_TYPE_MOUNT then
            id = SandE.currentCurrent[i]

            if IsCollectibleUsable(id) then
                UseCollectible(id)
                SandE.currentCurrent[i] = 0
            end
        elseif SandE.currentCurrent[i] ~= id then
            if IsCollectibleUsable(id) then
                UseCollectible(id)
                SandE.currentCurrent[i] = id
            end
        end
    end

    local index = SandE.sv.UserOutfit[SandE.currentIndex]
    if index == 0 then
        UnequipOutfit()
    else
        EquipOutfit(index)
    end

    SandE.disableUpdates = false
end

function SandE:getEntryName(index, name)
    return string.format("%d : %s", index, name)
end

function SandE:setTooltip(control, text)
    control.data = { tooltipText = text}

    control:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
    control:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
end

function SandE:SetupOutfitCombo()
    SandE.comboBox3:ClearItems()

    local FIRST_INDEX = 0
    local LAST_INDEX  = 10

    for i=FIRST_INDEX, LAST_INDEX do
        local name = SandE:GetOutfitName(i)

        if name:len() == 0 then
            break
        end

        name = SandE:getEntryName(i, name)
        local itemEntry = SandE.mainComboBox:CreateItemEntry(name, OutfitIndexCallback)
        SandE.comboBox3:AddItem(itemEntry, ZO_COMBOBOX_SURPRESS_UPDATE)
    end

    SandE.comboBox3:UpdateItems()
    local index = GetEquippedOutfitIndex() or 0
    SandE.comboBox3:SetSelectedItem(SandE:getEntryName(index, SandE:GetOutfitName(index)))
end

function SandE:CreateWindow()
    local o_comboBox = WINDOW_MANAGER:GetControlByName("SandEWindow", "Dropdown")
    local o_comboBox2 = WINDOW_MANAGER:GetControlByName("SandEWindow", "Dropdown2")
    local o_comboBox3 = WINDOW_MANAGER:GetControlByName("SandEWindow", "Dropdown3")

    SandE:setTooltip(o_comboBox3, "If you are currently looking at your current outfit, set it to that outfit, if you are looking at a custom user outfit, then set it for that loadout.")

    SandE.mainComboBox   = o_comboBox.m_comboBox
    SandE.comboBox2  = o_comboBox2.m_comboBox
    SandE.comboBox3  = o_comboBox3.m_comboBox

    SandE.mainComboBox:SetSortsItems(true)
    SandE.comboBox2:SetSortsItems(true)
    SandE.comboBox3:SetSortsItems(true)

    SandE.mainComboBox:ClearItems()
    SandE.comboBox2:ClearItems()

    function OutfitSelectCallback(comboBox, itemName, item, selectionChanged)
        if itemName == SandE.NEW then
            SandE.sv.userCount = SandE.sv.userCount + 1

            SandE.sv.User[SandE.sv.userCount] = {
                [COLLECTIBLE_CATEGORY_TYPE_MOUNT            ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_VANITY_PET       ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_COSTUME          ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_PERSONALITY      ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_HAT              ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_SKIN             ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_POLYMORPH        ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_HAIR             ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_FACIAL_HAIR_HORNS] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_PIERCING_JEWELRY ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING     ] = 0,
                [COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING     ] = 0,
            }
            SandE.sv.UserOutfit[SandE.sv.userCount] = 0
            SandE.sv.UserMap[SandE.sv.userCount] = "New"

            local name = SandE:getEntryName(SandE.sv.userCount, "New")
            local itemEntry = SandE.comboBox2:CreateItemEntry(name, OutfitSelectCallback)
            SandE.comboBox2:AddItem(itemEntry, ZO_COMBOBOX_SURPRESS_UPDATE)
            SandE.currentIndex = SandE.sv.userCount
            SandE:reloadComboBox2()
            SandE.comboBox2:SetSelectedItem(name)
        else
            SandE.currentIndex = tonumber(string.match(itemName, "%d+"))
        end

        SandE.currentSlot = SandE.sv.User[SandE.currentIndex]
        SandE:UpdateUI()

        SandEWindowSaveButton:SetHidden(false)
        SandEWindowLoadButton:SetHidden(false)
        SandEWindowDeleteButton:SetHidden(false)
        SandEWindowRenameEditBoxBackdrop:SetHidden(false)
    end

    function OutfitConfigCallback(comboBox, itemName, item, selectionChanged)
        SandEWindowSaveButton:SetHidden(true)
        SandEWindowLoadButton:SetHidden(true)
        SandEWindowDeleteButton:SetHidden(true)
        SandEWindowRenameEditBoxBackdrop:SetHidden(true)

        SandE.comboBox2:ClearItems()
        SandE.currentIndex = -1
        SandE.currentSlot = nil

        if itemName == SandE.CURRENT then
            o_comboBox2:SetHidden(true)

            SandE.currentType = SandE.CURRENT
            SandE.currentSlot = SandE.currentCurrent
            SandE:UpdateUI()
        else
            o_comboBox2:SetHidden(false)
            SandE.currentType = SandE.USER
            SandE.reloadComboBox2()
        end
    end

    function OutfitIndexCallback(comboBox, itemName, item, selectionChanged)
        local index = tonumber(string.match(itemName, "%d+"))
        if SandE.currentType == SandE.CURRENT then
            if index == 0 then
                UnequipOutfit()
            else
                EquipOutfit(index)
            end
        else
            SandE.sv.UserOutfit[SandE.currentIndex] = index
        end
    end

    for _, name in ipairs(SandE.configTypes) do
        local itemEntry = SandE.mainComboBox:CreateItemEntry(name, OutfitConfigCallback)
        SandE.mainComboBox:AddItem(itemEntry, ZO_COMBOBOX_SURPRESS_UPDATE)
    end

    SandE:SetupOutfitCombo()
    SandE:reloadComboBox2()

    SandE:CD()

    SandE.mainComboBox:UpdateItems()
    SandE.mainComboBox:SelectFirstItem()

    -- Edit
    SandEWindowRenameEditBoxBackdropEditBox:SetHandler("OnEnter", function()
        SandE:RenameUser(SandEWindowRenameEditBoxBackdropEditBox:GetText())
        SandEWindowRenameEditBoxBackdropEditBox:Clear()
        SandEWindowRenameEditBoxBackdropEditBox:LoseFocus()
    end)

    SandEWindowRenameEditBoxBackdropEditBox:SetHandler("OnFocusGained", function()
        HideMouse(false)
        SandEWindowRenameEditBoxBackdropEditBox:Clear()
        SandEWindowRenameEditBoxBackdropEditBox:SetColor(1,1,1,1)
        SandEWindowRenameEditBoxBackdrop:SetEdgeColor(1,1,1,1)
    end)

    SandEWindowRenameEditBoxBackdropEditBox:SetHandler("OnFocusLost", function()
        ShowMouse(false)
        SandEWindowRenameEditBoxBackdrop:SetEdgeColor(0,0,0,0)
        SandEWindowRenameEditBoxBackdropEditBox:SetText("Rename")
        SandEWindowRenameEditBoxBackdropEditBox:SetColor(.7,.7,.5,.5)
    end)

    SandEWindowRenameEditBoxBackdropEditBox:SetText("Rename")
    SandEWindowRenameEditBoxBackdropEditBox:SetColor(.7,.7,.5,.5)

    SandE:setTooltip(SandEWindowRenameEditBoxBackdropEditBox, "Press |c55ff55ENTER|r when done to save new name.")

    SandEWindowSaveButton:SetHandler("OnClicked", function() SandE:Save() end)
    SandE:setTooltip(SandEWindowSaveButton, "|c99ff99Save|r the current slot.")
    SandEWindowSaveButton:SetText("|c99ff99Save ")

    SandEWindowLoadButton:SetHandler("OnClicked", function() SandE:Load() end)
    SandE:setTooltip(SandEWindowLoadButton, "|c99ffffLoad|r the current slot.")
    SandEWindowLoadButton:SetText("|c99ffffLoad ")

    SandEWindowDeleteButton:SetHandler("OnClicked", function() SandE:Delete() end)
    SandE:setTooltip(SandEWindowDeleteButton, "|cff0033Delete|r the current slot.")
    SandEWindowDeleteButton:SetText("|cff0033Delete ")

    SandEWindowCloseButton:SetHandler("OnClicked", function() SandE:Close() end)
    SandE:setTooltip(SandEWindowCloseButton, "Close Window")
end

function SandE:Initialize()
    ZO_CreateStringId("SI_CATEGORY_NAME_STYLE_AND_ELEGANCE", SandE.name)
    ZO_CreateStringId("SI_BINDING_NAME_SANDE_TOGGLE_UI", "Toggle UI")
    for i, x in ipairs(SandE.BINDING_NAMES) do
        ZO_CreateStringId(x, "NO OUTFIT MADE YET : " .. tostring(i))
    end

    for i=7756, #EsoStrings do
        if EsoStrings[i] == "NO OUTFIT MADE YET : 1" then
            SandE.bindingStartingIndex = i
        end
    end

    SandE.sv = ZO_SavedVars:New("SandE_sv", 1, nil, SandE.Defaults)

    SandEWindow:ClearAnchors()
    SandEWindow:SetAnchor(SandE.sv.ui.point, GuiRoot, SandE.sv.ui.relPoint, SandE.sv.ui.offsetX, SandE.sv.ui.offsetY)

    Outfit_UI_ButtonBg:ClearAnchors()
    Outfit_UI_ButtonBg:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, SandE.sv.ui.buttonX, SandE.sv.ui.buttonY)
    Outfit_UI_ButtonBg:SetHidden(not SandE.sv.ui.showIcon)

    SandEWindow:SetHandler("OnMoveStop", function (self)
        local valid, point, _, relPoint, offsetX, offsetY = self:GetAnchor(0)
        if valid then
            SandE.sv.ui.point = point
            SandE.sv.ui.relPoint = relPoint
            SandE.sv.ui.offsetX = offsetX
            SandE.sv.ui.offsetY = offsetY
        end

        SandE:UpdateUI()
    end)

    SandE:CreateWindow()
    SandEWindowTitle:SetText(SandE.displayName)

    SandE:setTooltip(Outfit_UI_Button, "Open/Close " .. SandE.displayName .. " UI.")
    Outfit_UI_ButtonBg:SetHandler("OnMoveStop", function (self)
        local valid, point, _, relPoint, offsetX, offsetY = self:GetAnchor(0)
        if valid then
            SandE.sv.ui.buttonX = offsetX
            SandE.sv.ui.buttonY = offsetY
        end
    end)

    Outfit_UI_Button:SetHandler("OnClicked", function (self)
        toggleSandEUI()
    end)

    SandE.layerIndex, SandE.categoryIndex, SandE.actionIndex = GetActionIndicesFromName("SANDE_TOGGLE_UI")

    if SandE.layerIndex == nil or SandE.categoryIndex == nil or SandE.actionIndex == nil then
        Outfit_UI_ButtonLabel:SetText("")
    else
        keycode, _, _, _, _ = GetActionBindingInfo(SandE.layerIndex, SandE.categoryIndex, SandE.actionIndex)
        Outfit_UI_ButtonLabel:SetText(GetKeyName(keycode))
    end

    local scenes = {
        COLLECTIONS_BOOK_SCENE,
        GAMEPAD_COLLECTIONS_BOOK_SCENE,
        ZO_OUTFIT_STYLES_BOOK_SCENE,
        GAMEPAD_OUTFITS_SELECTION_SCENE,
    }

    for i, scene in ipairs(scenes) do
        scene:RegisterCallback("StateChange", function(oldstate, newState)
            if SandE.sv.ui.autoShow then
                if(scene:IsShowing()) then
                    SandEWindow:SetHidden(false)
                else
                    SandEWindow:SetHidden(true)
                end
            end
        end)
    end

    createSettings()
end

function SandE:UpdateUI()
    if SandE.currentSlot then
        for i, id in pairs(SandE.currentSlot) do
            if id ~= 0 then
                local name, desc, icon, _, unlocked, _, isActive, catType, hint, isPlaceholder = GetCollectibleInfo(id)
                local link = GetCollectibleLink(id, LINK_STYLE_BRACKETS)

                -- d (tostring(catType) .. " : |t20:20:" .. icon .. "|t " .. link)

                SandE.UIItems[i][1]:SetTexture(icon)
                if link then
                    SandE.UIItems[i][3]:SetHandler("OnMouseEnter", function (self)
                        -- d ( "MouseEnter " .. control:GetName() )
                        self.itemtool = ItemTooltip
                        InitializeTooltip(self.itemtool, SandE.UIItems[i][3], TOPLEFT, 0, 0, BOTTOMRIGHT)
                        self.itemtool:SetLink(link)
                    end)

                    SandE.UIItems[i][3]:SetHandler("OnMouseExit", function (self)
                        -- d ( "MouseExit " .. control:GetName() )
                        if self.itemtool then
                            ClearTooltip(self.itemtool)
                        end
                    end)
                end
                -- SandE.UIItems[i][2]:SetText(link)
            else
                SandE.UIItems[i][1]:SetTexture("EsoUI/Art/ActionBar/abilityInset.dds")
                SandE.UIItems[i][3]:SetHandler("OnMouseEnter", function (self)
                    -- d ( "MouseEnter " .. control:GetName() )
                    self.itemtool = InformationTooltip
                    InitializeTooltip(self.itemtool, SandE.UIItems[i][3], TOPLEFT, 0, 0, BOTTOMRIGHT)
                    SetTooltipText(self.itemtool, SandE.COLLECTIBLE_STRINGS[i])
                end)

                SandE.UIItems[i][3]:SetHandler("OnMouseExit", function (self)
                    -- d ( "MouseExit " .. control:GetName() )
                    if self.itemtool then
                        ClearTooltip(self.itemtool)
                    end
                end)
            end
        end
    end

    local index = 0

    if SandE.currentType == SandE.CURRENT then
        index = GetEquippedOutfitIndex() or 0
    else
        index = SandE.sv.UserOutfit[SandE.currentIndex]
    end

    if SandE.currentIndex ~= -1 then
        SandE.comboBox3:SetSelectedItem(SandE:getEntryName(index, SandE:GetOutfitName(index)))
    end

    Outfit_UI_Button:SetHidden(not SandE.sv.ui.showIcon)
    Outfit_UI_ButtonLabel:SetHidden(not SandE.sv.ui.showIcon)
end

function SandE:CD()
    SandE.currentCurrent = {}

    for _, i in ipairs(SandE.COLLECTIBLES) do
        SandE.currentCurrent[i] = GetActiveCollectibleByType(i)
    end
end

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_COLLECTIBLE_UPDATED, function(eventCode, id, justUnlocked)
    if SandE.disableUpdates then return end

    local catType = GetCollectibleCategoryType(id)
    for _, x in ipairs(SandE.COLLECTIBLES) do
        if x == catType then
            SandE:CD()

            if SandE.currentType == SandE.CURRENT then
                SandE.currentSlot = SandE.currentCurrent
                SandE:UpdateUI()
            end

            return
        end
    end
end)

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_ADD_ON_LOADED, function (event, addonName)
    if addonName ~= SandE.name then return end
    SandE:Initialize()
end)

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_PLAYER_ACTIVATED, function(eventCode, initial) -- {{{
    SandE:CD()
end)

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_OUTFIT_RENAME_RESPONSE, function(eventCode, response, outfitIndex) -- {{{
    if response == SET_OUTFIT_NAME_RESULT_SUCCESS then
        SandE:SetupOutfitCombo()
    end
end)

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_OUTFIT_EQUIP_RESPONSE, function(eventCode, response) -- {{{
    if response == EQUIP_OUTFIT_RESULT_SUCCESS then
        if ( SandE.currentType == SandE.CURRENT ) then
            SandE:SetupOutfitCombo()
        end
    end
end)

EVENT_MANAGER:RegisterForEvent(SandE.name, EVENT_KEYBINDING_SET, function(eventCode, layerIndex, categoryIndex, actionIndex, bindingIndex, keyCode)
    if layerIndex == nil or categoryIndex == nil or actionIndex == nil then
        Outfit_UI_ButtonLabel:SetText("")
    elseif layerIndex == SandE.layerIndex and categoryIndex == SandE.categoryIndex and actionIndex == SandE.actionIndex then
        Outfit_UI_ButtonLabel:SetText(GetKeyName(keyCode))
    end
end)

-- EVENT_MANAGER:RegisterForEvent(COLLECTIONS_BOOK_SCENE)
