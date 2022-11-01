-- Pitch Settings

SetCVar("CameraKeepCharacterCentered", 0)
SetCVar("test_cameraDynamicPitch", 1)
SetCVar("test_cameraDynamicPitchBaseFovPad", 0.45)
SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.45)
SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.45)


-- Script Errors

SetCVar("scriptErrors", 1)

-- Spellqueue

SetCVar("SpellQueueWindow", 200)

-- set player spec

NotifyInspect("player")
RegisterCVar("MySpec", GetInspectSpecialization("player"))

-- ElvUI Performance Tuning

SetCVar("RAIDWaterDetail", 0)
SetCVar("RAIDweatherDensity", 0)
-- SetCVar("RAIDweatherDensity", 3)

-- own cvars

RegisterCVar("myCommandBar", 1)
RegisterCVar("myRaidBar", 0)
RegisterCVar("myProfessionBar", 0)

SetCVar("myRaidBar", 0)
SetCVar("myProfessionBar", 0)




SLASH_STATS1 = "/STATS"

local function GetStatsDistrib()
    local class, classFileName = UnitClass("player")
    local locClass, enClass, classID = UnitClass("player")  local role, globalSpecID, playerRole
    local specId = GetSpecialization()
    if specId then
      globalSpecID,_,_,_,_,role = GetSpecializationInfo(specId)
    end
    
    -- https://wowpedia.fandom.com/wiki/API_GetSpecializationInfo

    local id = globalSpecID
    local MyStatsText = ''

    -- MyStatsText =  MyStatsText .. id .. "\n"
    if id == 267 then
        -- Destruction Warlock, Haste > Crit > Mastery > Versatility
        MyStatsText =  MyStatsText .. class .. ' (Destruction, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                       .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") => "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n"
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/warlock/destruction/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/destruction-warlock/stats-races-and-consumables\n" 
    elseif id == 70 then
        -- Retribution Paladin, Mastery > Haste = Versatility > Crit
        MyStatsText =  MyStatsText .. class .. ' (Retribution Paladin, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Strength ("  .. UnitStat("player",1)                        .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") = "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/paladin/retribution/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/retribution-paladin/stats-races-and-consumables\n" 
    elseif id == 104 then
        -- Guardian Druid, Versatility > Mastery >= Haste > Crit
        MyStatsText =  MyStatsText .. class .. ' (Guardian Druid, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") ≥ "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/druid/guardian/stat-priority-pve-tank\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/guardian-druid/stats-races-and-consumables\n" 
    elseif id == 105 then
        -- Restoration Druid, Versatility > Mastery >= Haste > Crit
        MyStatsText =  MyStatsText .. class .. ' (Restoration Druid, for raiding:, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") = "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") = "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") = "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") \n\n"
        MyStatsText =  MyStatsText .. class .. ' (Restoration Druid, for m+:, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") \n"
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/druid/restoration/stat-priority-pve-healer\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/restoration-druid/stats-races-and-consumables\n" 
    elseif id == 250 then
        -- Death Knight - Blood, Haste > Versatility > Critical Strike > Mastery
        MyStatsText =  MyStatsText .. class .. ' (Blood Death Knight, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level over all stats as more stamina and main stat always are good. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/death-knight/blood/stat-priority-pve-tank\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/blood-death-knight/stats-races-and-consumables\n" 
    elseif id == 253 then
        -- Beats Mastery Hunter, Critical Strike > Haste > Versatility > Mastery
        MyStatsText =  MyStatsText .. class .. ' (Beats Mastery Hunter, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/hunter/beast-mastery/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/beast-mastery-hunter/stats-races-and-consumables\n" 
    elseif id == 266 then
        -- Intellect / Item Level >>> Haste > Mastery = Crit > Versatility
        MyStatsText =  MyStatsText .. class .. ' (Demonology Warlock, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") >> "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") = "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " - https://www.wowhead.com/guide/classes/warlock/demonology/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " - https://www.method.gg/guides/demonology-warlock/stats-races-and-consumables\n" 
    else
        MyStatsText =  MyStatsText .. class .. " (not yet implemented)\n" 
    end
    -- MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
    -- MyStatsText =  MyStatsText .. " - https://www.wowhead.com/classes\n" 
    -- MyStatsText =  MyStatsText .. " - https://www.method.gg/guides)\n" 

    MyStatsText =  MyStatsText .. "\nGeneral stats:\n"
    MyStatsText =  MyStatsText .. "  Strength ("       .. UnitStat("player",1)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Agility ("        .. UnitStat("player",2)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Stamina ("        .. UnitStat("player",3)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Intellect ("      .. UnitStat("player",4)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Maximun Health (" .. UnitHealthMax("player") .. ") \n"

    StatsEditBox_Show(MyStatsText)

end

SlashCmdList["STATS"] = GetStatsDistrib

-- toggle selfhiglight

SLASH_METOGGLES1 = "/METOGGLES"
SLASH_METOGGLES2 = "/MT2"

local function ToogleFindMe()
    if GetCVar("FindYourselfAnywhere") == "1" then 
        SetCVar("FindYourselfAnywhere", "0") 
    else 
        SetCVar("FindYourselfAnywhere", "1")
    end
end

SlashCmdList["METOGGLES"] = ToogleFindMe

SLASH_MYRAIDSET1 = "/MYRAIDSET"


    -- Blizzard Number   Used for      ElvUI                Blizzard API
    -----------------------------------------------------------------------------
    --  Actionbar 1.1   Cooldowns    ElvUI Bar 1        (Primary Action Bar 1)
    --  Actionbar 1.2   Profession   ElvUI Bar 2        (Primary Action Bar 2)
    --  Actionbar 2     Keybinds     ElvUI Bar 6        MultiBarBottomLeft
    --  Actionbar 3     Raid         ElvUI Bar 5        MultiBarBottomRight
    --  Actionbar 4     Keybinds     ElvUI Bar 3        MultiBarRight
    --  Actionbar 5     Keybinds     ElvUI Bar 4        MultiBarLeft


    
-- toggle raid actionbars and disable professions bar

local function ToggleMyRaidSet()
    if IsAddOnLoaded("ElvUI") then
        -- ElvUI
        local Bars, BarNumber = {5}, unpack(ElvUI); 
        for _, n in pairs(Bars) do 
            local state = BarNumber.db.actionbar["bar"..n].enabled; 
            BarNumber.db.actionbar["bar"..n].enabled = (state==false and true or false);
            BarNumber.ActionBars:PositionAndSizeBar("bar"..n);
            if BarNumber.db.actionbar["bar"..n].enabled == true then
                SetCVar("FindYourselfAnywhere", "1")
                local bars, E = {2}, unpack(ElvUI);
                E.db.actionbar["bar"..2].enabled = false;
                E.ActionBars:PositionAndSizeBar("bar"..2);
            else
                SetCVar("FindYourselfAnywhere", "0")
            end
        end
    else
    -- Blizzard UI
        SetCVar("myProfessionBar", "0")
        if GetCVar("myRaidBar") == "1" then
            -- changeactionbar [actionbar:1]2
            ChangeActionBarPage("1")
            MultiBarBottomRight:Hide() 
            SetCVar("myRaidBar", "0")
            SetCVar("FindYourselfAnywhere", "0")
        else
            ChangeActionBarPage("1")
            MultiBarBottomRight:Show() 
            SetCVar("myRaidBar", "1")
            SetCVar("FindYourselfAnywhere", "1")
            -- SetCVar("myProfessionBar", "0")
        end
    end 
end

SlashCmdList["MYRAIDSET"] = ToggleMyRaidSet

SLASH_MYPROFESSIONSET1 = "/MYPROFESSIONSET"

-- toggle professions bar, disable raid bar setup

local function ToggleMyPROFESSIONSet()
    if IsAddOnLoaded("ElvUI") then
-- ElvUI
        local Bars, BarNumber = {2}, unpack(ElvUI); 
        for _, n in pairs(Bars) do 
            local state = BarNumber.db.actionbar["bar"..n].enabled; 
            BarNumber.db.actionbar["bar"..n].enabled = (state==false and true or false);
            BarNumber.ActionBars:PositionAndSizeBar("bar"..n);
            if BarNumber.db.actionbar["bar"..n].enabled == true then
                SetCVar("FindYourselfAnywhere", "0")
                local bars, E = {5}, unpack(ElvUI);
                E.db.actionbar["bar"..5].enabled = false;
                E.ActionBars:PositionAndSizeBar("bar"..5);
            end
        end
    else
-- Blizzard UI
        if GetCVar("myProfessionBar") == "1" then
            ChangeActionBarPage("1") 
            SetCVar("myProfessionBar", "0")
            SetCVar("myRaidBar", "0")
            MultiBarBottomRight:Hide()
        else
            ChangeActionBarPage("2")
            SetCVar("myProfessionBar", "1")
            SetCVar("myRaidBar", "0")
            MultiBarBottomRight:Hide()
        end
    end
end

SlashCmdList["MYPROFESSIONSET"] = ToggleMyPROFESSIONSet

-- edit box with class stats
 
function StatsEditBox_Show(text)
    if not StatsEditBox then
        local FrameAysons = CreateFrame("Frame", "StatsEditBox", UIParent, "DialogBoxFrame")
        FrameAysons:SetPoint("CENTER")
        FrameAysons:SetSize(720,480)
        
        FrameAysons:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
            edgeSize = 16,
            insets = { left = 8, right = 6, top = 8, bottom = 8 },
        })
        FrameAysons:SetBackdropBorderColor(0, .44, .87, 0.5) -- darkblue
        
        -- Movable
        FrameAysons:SetMovable(true)
        FrameAysons:SetClampedToScreen(true)
        FrameAysons:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self:StartMoving()
            end
        end)
        FrameAysons:SetScript("OnMouseUp", FrameAysons.StopMovingOrSizing)
        
        -- ScrollFrame
        local ScrollFrameAysons = CreateFrame("ScrollFrame", "StatsEditBoxScrollFrame", StatsEditBox, "UIPanelScrollFrameTemplate")
        ScrollFrameAysons:SetPoint("LEFT", 16, 0)
        ScrollFrameAysons:SetPoint("RIGHT", -32, 0)
        ScrollFrameAysons:SetPoint("TOP", 0, -16)
        ScrollFrameAysons:SetPoint("BOTTOM", StatsEditBoxButton, "TOP", 0, 0)
        
        -- EditBox
        local EditBoxAysons = CreateFrame("EditBox", "StatsEditBoxEditBox", StatsEditBoxScrollFrame)
        EditBoxAysons:SetSize(ScrollFrameAysons:GetSize())
        EditBoxAysons:SetMultiLine(true)
        EditBoxAysons:SetAutoFocus(false) -- dont automatically focus
        EditBoxAysons:SetFontObject("ChatFontNormal")
        EditBoxAysons:SetScript("OnEscapePressed", function() FrameAysons:Hide() end)
        ScrollFrameAysons:SetScrollChild(EditBoxAysons)
        
        -- Resizable
        FrameAysons:SetResizable(true)
        FrameAysons:SetResizeBounds(150,100,1280,720)
    
        local ButtonAysons = CreateFrame("Button", "StatsEditBoxResizeButton", StatsEditBox)
        ButtonAysons:SetPoint("BOTTOMRIGHT", -6, 7)
        ButtonAysons:SetSize(16, 16)
        
        ButtonAysons:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        ButtonAysons:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        ButtonAysons:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        
        ButtonAysons:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                FrameAysons:StartSizing("BOTTOMRIGHT")
                self:GetHighlightTexture():Hide() -- more noticeable
            end
        end)
        ButtonAysons:SetScript("OnMouseUp", function(self, button)
            FrameAysons:StopMovingOrSizing()
            self:GetHighlightTexture():Show()
            EditBoxAysons:SetWidth(ScrollFrameAysons:GetWidth())
        end)
        FrameAysons:Show()
    end
    
    if text then
        StatsEditBoxEditBox:SetText(text)
    end
    StatsEditBox:Show()
end

-- function Aysons:GetMainFrame(text)
function GetMainFrame(text)
  -- Frame code largely adapted from https://www.wowinterface.com/forums/showpost.php?p=323901&postcount=2
  if not AysonsFrame then
    -- Main Frame
    local frameConfig = self.db.profile.frame
    local FrameAysons = CreateFrame("Frame", "AysonsFrame", UIParent, "DialogBoxFrame")
    FrameAysons:ClearAllPoints()
    -- load position from local DB
    FrameAysons:SetPoint(
      frameConfig.point,
      frameConfig.relativeFrame,
      frameConfig.relativePoint,
      frameConfig.ofsx,
      frameConfig.ofsy
    )
    FrameAysons:SetSize(frameConfig.width, frameConfig.height)
    FrameAysons:SetBackdrop({
      bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
      edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight",
      edgeSize = 16,
      insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    FrameAysons:SetMovable(true)
    FrameAysons:SetClampedToScreen(true)
    FrameAysons:SetScript("OnMouseDown", function(self, button)
      if button == "LeftButton" then
        self:StartMoving()
      end
    end)
    FrameAysons:SetScript("OnMouseUp", function(self, button)
      self:StopMovingOrSizing()
      -- save position between sessions
      local point, relativeFrame, relativeTo, ofsx, ofsy = self:GetPoint()
      frameConfig.point = point
      frameConfig.relativeFrame = relativeFrame
      frameConfig.relativePoint = relativeTo
      frameConfig.ofsx = ofsx
      frameConfig.ofsy = ofsy
    end)

    -- scroll frame
    local ScrollFrameAysons = CreateFrame("ScrollFrame", "AysonsScrollFrame", f, "UIPanelScrollFrameTemplate")
    ScrollFrameAysons:SetPoint("LEFT", 16, 0)
    ScrollFrameAysons:SetPoint("RIGHT", -32, 0)
    ScrollFrameAysons:SetPoint("TOP", 0, -32)
    ScrollFrameAysons:SetPoint("BOTTOM", AysonsFrameButton, "TOP", 0, 0)

    -- edit box
    local EditBoxAysons = CreateFrame("EditBox", "AysonsEditBox", AysonsScrollFrame)
    EditBoxAysons:SetSize(ScrollFrameAysons:GetSize())
    EditBoxAysons:SetMultiLine(true)
    EditBoxAysons:SetAutoFocus(true)
    EditBoxAysons:SetFontObject("ChatFontNormal")
    EditBoxAysons:SetScript("OnEscapePressed", function() FrameAysons:Hide() end)
    ScrollFrameAysons:SetScrollChild(EditBoxAysons)

    -- resizing
    FrameAysons:SetResizable(true)
    FrameAysons:SetResizeBounds(150, 100)
    local ButtonAysons = CreateFrame("Button", "AysonsResizeButton", FrameAysons)
    ButtonAysons:SetPoint("BOTTOMRIGHT", -6, 7)
    ButtonAysons:SetSize(16, 16)

    ButtonAysons:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    ButtonAysons:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    ButtonAysons:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

    ButtonAysons:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            FrameAysons:StartSizing("BOTTOMRIGHT")
            self:GetHighlightTexture():Hide() -- more noticeable
        end
    end)
    ButtonAysons:SetScript("OnMouseUp", function(self, button)
        FrameAysons:StopMovingOrSizing()
        self:GetHighlightTexture():Show()
        EditBoxAysons:SetWidth(ScrollFrameAysons:GetWidth())

        -- save size between sessions
        frameConfig.width = FrameAysons:GetWidth()
        frameConfig.height = FrameAysons:GetHeight()
    end)

    AysonsFrame = f
  end
  AysonsEditBox:SetText(text)
  AysonsEditBox:HighlightText()
  return AysonsFrame
end


-- clamp  name plates above actionbars and hekili

SLASH_MYNAMEPLATES1 = "/MYNAMEPLATES"
SLASH_MYNAMEPLATES2 = "/NP"

local function MyNameplates()
-- Nameplate Settings
    SetCVar("nameplateOtherTopInset", 0.08)
    SetCVar("nameplateOtherBottomInset", 0.28)
-- SetCVar("nameplateLargeBottomInset", 0.15)
-- SetCVar("nameplateLargeTopInset", 0.1)

end

SlashCmdList["MYNAMEPLATES"] = MyNameplates

SLASH_MYCOMMANDBAR1 = "/MYCOMMANDBAR"
SLASH_MYCOMMANDBAR2 = "/MCB"

-- toggle hidden command bars for keybinds 

local function MYCOMMANDBAR()
    if IsAddOnLoaded("ElvUI") then
-- ElvUI
        local bars, E = {3,4,6}, unpack(ElvUI)
        for _, n in pairs(bars) do
            local state = E.db.actionbar["bar"..n].enabled; E.db.actionbar["bar"..n].enabled = (state==false and true or false); E.ActionBars:PositionAndSizeBar("bar"..n)
        end
    else
-- Blizzard UI
        if GetCVar("myCommandBar") == "1" then
            MultiBarBottomLeft:Hide()
            MultiBarRight:Hide()
            MultiBarLeft:Hide()
            SetCVar("myCommandBar", "0")
        else
            MultiBarBottomLeft:Show()
            MultiBarRight:Show()
            MultiBarLeft:Show()
            SetCVar("myCommandBar", "1")
        end
    end
end

SlashCmdList["MYCOMMANDBAR"] = MYCOMMANDBAR