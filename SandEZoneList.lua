local SE_DATA = 1

SandEZoneList = ZO_SortFilterList:Subclass()

function SandEZoneList:New( control )
    local list = ZO_SortFilterList.New(self, control)
    list.frame = control
    list:Setup()
    return(list)
end

function SandEZoneList:Setup( )
    ZO_ScrollList_AddDataType(self.list, SE_DATA, "SandEZoneRow", 30, function(control, data) self:SetupItemRow(control, data) end)
    ZO_ScrollList_EnableHighlight(self.list, "ZO_ThinListHighlight")
    self:SetAlternateRowBackgrounds(true)

    self.masterList = { }

    local sortKeys = {
        ["name"]     = { caseInsensitive = true },
        -- ["itemType"] = { caseInsensitive = true, tiebreaker = "name" },
        -- ["source"]   = { caseInsensitive = true, tiebreaker = "itemType" },
    }

    self.currentSortKey = "name"
    self.currentSortOrder = ZO_SORT_ORDER_UP
    self.sortHeaderGroup:SelectAndResetSortForKey(self.currentSortKey)
    self.sortFunction = function( listEntry1, listEntry2 )
        return(ZO_TableOrderingFunction(listEntry1.data, listEntry2.data, self.currentSortKey, sortKeys, self.currentSortOrder))
    end

    self.filterDrop = ZO_ComboBox_ObjectFromContainer(self.frame:GetNamedChild("FilterDrop"))
    self:InitializeComboBox(self.filterDrop, "SI_ITEMBROWSER_FILTERDROP", 8)

    self.searchDrop = ZO_ComboBox_ObjectFromContainer(self.frame:GetNamedChild("SearchDrop"))
    self:InitializeComboBox(self.searchDrop, "SI_ITEMBROWSER_SEARCHDROP", 2)

    self.searchBox = self.frame:GetNamedChild("SearchBox")
    self.searchBox:SetHandler("OnTextChanged", function() self:RefreshFilters() end)
    self.search = ZO_StringSearch:New()
    self.search:AddProcessor(SandEZone.sortType, function(stringSearch, data, searchTerm, cache) return(self:ProcessItemEntry(stringSearch, data, searchTerm, cache)) end)

    SandEZone.scene = ZO_Scene:New("SandEZoneScene", SCENE_MANAGER)
    SandEZone.scene:AddFragment(ZO_SetTitleFragment:New(SI_ITEMBROWSER_TITLE))
    SandEZone.scene:AddFragment(ZO_FadeSceneFragment:New(SandEZoneFrame))
    SandEZone.scene:AddFragment(TITLE_FRAGMENT)
    SandEZone.scene:AddFragment(RIGHT_BG_FRAGMENT)
    SandEZone.scene:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    SandEZone.scene:AddFragment(CODEX_WINDOW_SOUNDS)
    SandEZone.scene:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
    SandEZone.scene:AddFragmentGroup(FRAGMENT_GROUP.FRAME_TARGET_STANDARD_RIGHT_PANEL)

    self:RefreshData()
end

function SandEZoneList:BuildMasterList( )
    self.masterList = { }
    for i = 1, #SandEZone.data.items do
        table.insert(self.masterList, SandEZone.CreateEntryFromRaw(SandEZone.data.items[i]))
    end
end

function SandEZoneList:FilterScrollList( )
    local scrollData = ZO_ScrollList_GetDataList(self.list)
    ZO_ClearNumericallyIndexedTable(scrollData)

    self.searchType = self.searchDrop:GetSelectedItemData().id
    local filterId = self.filterDrop:GetSelectedItemData().id
    local searchInput = self.searchBox:GetText()

    for i = 1, #self.masterList do
        local data = self.masterList[i]

        if ( (filterId == 1 or (data.zoneType[filterId - 2] and not (filterId > 2 and filterId < 7 and data.zoneType[0]))) and
             (searchInput == "" or self:CheckForMatch(data, searchInput)) ) then
            table.insert(scrollData, ZO_ScrollList_CreateDataEntry(SE_DATA, data))
        end
    end

    if (#scrollData ~= #self.masterList) then
        self.frame:GetNamedChild("Counter"):SetText(string.format("%d / %d", #scrollData, #self.masterList))
    else
        self.frame:GetNamedChild("Counter"):SetText("")
    end
end

function SandEZoneList:SortScrollList( )
    if (self.currentSortKey ~= nil and self.currentSortOrder ~= nil) then
        local scrollData = ZO_ScrollList_GetDataList(self.list)
        table.sort(scrollData, self.sortFunction)
    end

    self:RefreshVisible()
end

function SandEZoneList:SetupItemRow( control, data )
    control.data = data

    control:GetNamedChild("Name").normalColor = ZO_DEFAULT_TEXT
    control:GetNamedChild("Name"):SetText(data.name)

    control:GetNamedChild("Type").nonRecolorable = true
    control:GetNamedChild("Type"):SetColor(data.color:UnpackRGBA())
    control:GetNamedChild("Type"):SetText(data.itemType)

    control:GetNamedChild("Source").normalColor = ZO_DEFAULT_TEXT
    control:GetNamedChild("Source"):SetText(data.source)

    ZO_SortFilterList.SetupRow(self, control, data)
end

function SandEZoneList:OrderedSearch( haystack, needles )
    -- A search for "spell damage" should match "Spell and Weapon Damage" but
    -- not "damage from enemy spells", so search term order must be considered

    haystack = haystack:lower()
    needles = needles:lower()

    local i = 0

    for needle in needles:gmatch("%S+") do
        i = haystack:find(needle, i + 1, true)
        if (not i) then return(false) end
    end

    return(true)
end

function SandEZoneList:CheckForMatch( data, searchInput )
    local curpos = 1
    local delim

    repeat
        delim = searchInput:find("|", curpos)
        if (not delim) then delim = 0 end

        local searchFragment = searchInput:sub(curpos, delim - 1)

        -- Allow empty query if it is the only (i.e., first and last) query
        if (searchFragment:find("%S+") or (curpos == 1 and delim == 0)) then
            if (self.searchType == 1) then
                if (self.search:IsMatch(searchFragment, data)) then return(true) end
            end
        end

        curpos = delim + 1
    until delim == 0

    return(false)
end

function SandEZoneList:ProcessItemEntry( stringSearch, data, searchTerm, cache )
    if ( zo_plainstrfind(data.name:lower(), searchTerm) or
         zo_plainstrfind(data.subname:lower(), searchTerm) or
         zo_plainstrfind(data.itemType:lower(), searchTerm) or
         zo_plainstrfind(data.source:lower(), searchTerm) ) then
        return(true)
    end

    return(false)
end

function SandEZoneList:InitializeComboBox( control, prefix, max )
    control:SetSortsItems(false)
    control:ClearItems()

    local callback = function( comboBox, entryText, entry, selectionChanged )
        self:RefreshFilters()
    end

    for i = 1, max do
        local entry = ZO_ComboBox:CreateItemEntry(GetString(prefix, i), callback)
        entry.id = i
        control:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
    end

    control:SelectItemByIndex(1, true)
end

function SandEZoneRow_OnMouseEnter( control )
    SandEZone.list:Row_OnMouseEnter(control)

    InitializeTooltip(SandEZoneTooltip, SandEZoneFrame, TOPRIGHT, -100, 0, TOPLEFT)
    SandEZoneTooltip:SetLink(control.data.itemLink)
end

function SandEZoneRow_OnMouseExit( control )
    SandEZone.list:Row_OnMouseExit(control)

    ClearTooltip(SandEZoneTooltip)
end

function SandEZoneRow_OnMouseUp( control )
    SandEZone.AddToChat(control.data.itemLink)
end
