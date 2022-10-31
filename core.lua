********************************************************************************
Aysons
@project-version@
********************************************************************************
-- UI 

-- Castbar

-- CastingBarFrame:UnregisterAllEvents()

-- -- PlayerFrame:SetScript("OnEvent", nil);
-- PlayerFrame:Hide()

-- -- TargetFrame:SetScript("OnEvent", nil);
-- TargetFrame:Hide()


-- hides the social tab button above chat
-- QuickJoinToastButton:SetScript("OnEvent", nil);
-- QuickJoinToastButton:Hide()
-- -- QuickJoinToastButton:SetScript("OnEvent", nil);
-- QuickJoinToastButton.Toast:Hide()

-- Pitch Settings

SetCVar("CameraKeepCharacterCentered", 0)
SetCVar("test_cameraDynamicPitch", 1)
SetCVar("test_cameraDynamicPitchBaseFovPad", 0.55)
SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.55)
SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.55)


-- Script Errors
SetCVar("scriptErrors", 1)

-- Spellqueue
SetCVar("SpellQueueWindow", 200)

-- Minimap default
-- SetCVar("MinimapTrackedInfov2", 491528)

NotifyInspect("player")
RegisterCVar("MySpec", GetInspectSpecialization("player"))

-- ElvUI Performance Tuning
SetCVar("RAIDWaterDetail", 0)
SetCVar("RAIDweatherDensity", 0)
-- SetCVar("RAIDweatherDensity", 3)

-- 
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
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
    elseif id == 70 then
        -- Retribution Paladin, Mastery > Haste = Versatility > Crit
        MyStatsText =  MyStatsText .. class .. ' (Retribution Paladin, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Strength ("  .. UnitStat("player",1)                        .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") = "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ")\n "
    elseif id == 104 then
        -- Guardian Druid, Versatility > Mastery >= Haste > Crit
        MyStatsText =  MyStatsText .. class .. ' (Guardian Druid, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") ≥ "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ")\n "
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
    elseif id == 250 then
        -- Death Knight - Blood, Haste > Versatility > Critical Strike > Mastery
        MyStatsText =  MyStatsText .. class .. ' (Blood Death Knight, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level over all stats as more stamina and main stat always are good. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ")\n "
    elseif id == 253 then
        -- Beats Mastery Hunter, Critical Strike > Haste > Versatility > Mastery
        MyStatsText =  MyStatsText .. class .. ' (Beats Mastery Hunter, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ")\n "
    elseif id == 266 then
        -- Intellect / Item Level >>> Haste > Mastery = Crit > Versatility
        MyStatsText =  MyStatsText .. class .. ' (Demonology Warlock, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") >> "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") = "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
    else
        MyStatsText =  MyStatsText .. class .. " (not yet implemented)\n" 
    end
    MyStatsText =  MyStatsText .. "\n(Above stats for " .. class .. " shown ordered according to https://www.method.gg/guides)\n\n" 

    MyStatsText =  MyStatsText .. "General stats:\n"
    MyStatsText =  MyStatsText .. "  Strength ("       .. UnitStat("player",1)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Agility ("        .. UnitStat("player",2)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Stamina ("        .. UnitStat("player",3)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Intellect ("      .. UnitStat("player",4)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Maximun Health (" .. UnitHealthMax("player") .. ") \n"

    StatsEditBox_Show(MyStatsText)

end

SlashCmdList["STATS"] = GetStatsDistrib

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

function StatsEditBox_Show(text)
    if not StatsEditBox then
        local f = CreateFrame("Frame", "StatsEditBox", UIParent, "DialogBoxFrame")
        f:SetPoint("CENTER")
        f:SetSize(720, 240)
        
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
            edgeSize = 16,
            insets = { left = 8, right = 6, top = 8, bottom = 8 },
        })
        f:SetBackdropBorderColor(0, .44, .87, 0.5) -- darkblue
        
        -- Movable
        f:SetMovable(true)
        f:SetClampedToScreen(true)
        f:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self:StartMoving()
            end
        end)
        f:SetScript("OnMouseUp", f.StopMovingOrSizing)
        
        -- ScrollFrame
        local sf = CreateFrame("ScrollFrame", "StatsEditBoxScrollFrame", StatsEditBox, "UIPanelScrollFrameTemplate")
        sf:SetPoint("LEFT", 16, 0)
        sf:SetPoint("RIGHT", -32, 0)
        sf:SetPoint("TOP", 0, -16)
        sf:SetPoint("BOTTOM", StatsEditBoxButton, "TOP", 0, 0)
        
        -- EditBox
        local eb = CreateFrame("EditBox", "StatsEditBoxEditBox", StatsEditBoxScrollFrame)
        eb:SetSize(sf:GetSize())
        eb:SetMultiLine(true)
        eb:SetAutoFocus(false) -- dont automatically focus
        eb:SetFontObject("ChatFontNormal")
        eb:SetScript("OnEscapePressed", function() f:Hide() end)
        sf:SetScrollChild(eb)
        
        -- Resizable
        f:SetResizable(true)
        f:SetMinResize(150,100)
    
        local rb = CreateFrame("Button", "StatsEditBoxResizeButton", StatsEditBox)
        rb:SetPoint("BOTTOMRIGHT", -6, 7)
        rb:SetSize(16, 16)
        
        rb:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        rb:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        rb:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        
        rb:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                f:StartSizing("BOTTOMRIGHT")
                self:GetHighlightTexture():Hide() -- more noticeable
            end
        end)
        rb:SetScript("OnMouseUp", function(self, button)
            f:StopMovingOrSizing()
            self:GetHighlightTexture():Show()
            eb:SetWidth(sf:GetWidth())
        end)
        f:Show()
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
    local f = CreateFrame("Frame", "AysonsFrame", UIParent, "DialogBoxFrame")
    f:ClearAllPoints()
    -- load position from local DB
    f:SetPoint(
      frameConfig.point,
      frameConfig.relativeFrame,
      frameConfig.relativePoint,
      frameConfig.ofsx,
      frameConfig.ofsy
    )
    f:SetSize(frameConfig.width, frameConfig.height)
    f:SetBackdrop({
      bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
      edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight",
      edgeSize = 16,
      insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:SetScript("OnMouseDown", function(self, button)
      if button == "LeftButton" then
        self:StartMoving()
      end
    end)
    f:SetScript("OnMouseUp", function(self, button)
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
    local sf = CreateFrame("ScrollFrame", "AysonsScrollFrame", f, "UIPanelScrollFrameTemplate")
    sf:SetPoint("LEFT", 16, 0)
    sf:SetPoint("RIGHT", -32, 0)
    sf:SetPoint("TOP", 0, -32)
    sf:SetPoint("BOTTOM", AysonsFrameButton, "TOP", 0, 0)

    -- edit box
    local eb = CreateFrame("EditBox", "AysonsEditBox", AysonsScrollFrame)
    eb:SetSize(sf:GetSize())
    eb:SetMultiLine(true)
    eb:SetAutoFocus(true)
    eb:SetFontObject("ChatFontNormal")
    eb:SetScript("OnEscapePressed", function() f:Hide() end)
    sf:SetScrollChild(eb)

    -- resizing
    f:SetResizable(true)
    f:SetMinResize(150, 100)
    local rb = CreateFrame("Button", "AysonsResizeButton", f)
    rb:SetPoint("BOTTOMRIGHT", -6, 7)
    rb:SetSize(16, 16)

    rb:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    rb:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    rb:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

    rb:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            f:StartSizing("BOTTOMRIGHT")
            self:GetHighlightTexture():Hide() -- more noticeable
        end
    end)
    rb:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
        self:GetHighlightTexture():Show()
        eb:SetWidth(sf:GetWidth())

        -- save size between sessions
        frameConfig.width = f:GetWidth()
        frameConfig.height = f:GetHeight()
    end)

    AysonsFrame = f
  end
  AysonsEditBox:SetText(text)
  AysonsEditBox:HighlightText()
  return AysonsFrame
end

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