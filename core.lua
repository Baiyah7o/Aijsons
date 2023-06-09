-- Disable the ActionCam warning message.
UIParent:UnregisterEvent("EXPERIMENTAL_CVAR_CONFIRMATION_NEEDED")

-- Pitch Settings

RegisterCVar("myPitch", 2)
RegisterCVar("myPitchSetname", "bottom")

SetCVar("CameraKeepCharacterCentered", 0)
SetCVar("nameplateOtherAtBase", 1)
SetCVar("test_cameraDynamicPitch", 1)
SetCVar("test_cameraDynamicPitchBaseFovPad", 0.4)
SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.65)
SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.75)

-- Script Errors

SetCVar("scriptErrors", 1)


-- hide extra button bar art 
-- list elements with /fstack

ExtraActionButton1.style:Hide()
ExtraActionButton1.IconMask:Hide()
ExtraActionButton1.HighlightTexture:Show()
ExtraActionButton1.HotKey:Show()

-- Target settings

SetCVar("FindYourselfAnywhere", "0")
SetCVar("SoftTargetEnemy", "0")        --  0 off, 1 gamepad 2 kbm, 3 always
SetCVar("SoftTargetEnemyArc", "1")     --  0 none, 1 in front, 2 in target arrea

-- Spellqueue

SetCVar("SpellQueueWindow", 200)

-- set player spec

NotifyInspect("player")
RegisterCVar("MySpec", GetInspectSpecialization("player"))

-- ElvUI Performance Tuning

SetCVar("RAIDWaterDetail", 0)
SetCVar("RAIDweatherDensity", 0)

-- own cvars

-- RegisterCVar("myCommandBar", 1)
-- RegisterCVar("myRaidBar", 0)
-- RegisterCVar("myProfessionBar", 0)
-- RegisterCVar("myWeeklies", 0)

-- SetCVar("myRaidBar", 0)
-- SetCVar("myProfessionBar", 0)


local function Add_Item_Id(tooltip)
    local itemLink = TooltipUtil.GetDisplayedItem(tooltip)
    if (itemLink ~= nil) then
        local itemId, _, _, _, icon, _, _ = GetItemInfoInstant(itemLink)
         -- itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subclassID
        if itemId then 
            local count = GetItemCount(itemId)
            local totalcount = GetItemCount(itemId,true)
            left = NORMAL_FONT_COLOR_CODE .. "Item ID" .. FONT_COLOR_CODE_CLOSE
            right = HIGHLIGHT_FONT_COLOR_CODE .. itemId .. FONT_COLOR_CODE_CLOSE
            tooltip:AddDoubleLine(left, right)
            left = NORMAL_FONT_COLOR_CODE .. "Icon ID" .. FONT_COLOR_CODE_CLOSE
            right = HIGHLIGHT_FONT_COLOR_CODE .. icon .. FONT_COLOR_CODE_CLOSE
            tooltip:AddDoubleLine(left, right)
            if (count ~= 1) then
                left = NORMAL_FONT_COLOR_CODE .. "Bags" .. FONT_COLOR_CODE_CLOSE
                right = HIGHLIGHT_FONT_COLOR_CODE .. count .. FONT_COLOR_CODE_CLOSE
                tooltip:AddDoubleLine(left, right)
            elseif (count ~= totalcount) then
                left = NORMAL_FONT_COLOR_CODE .. "Bank" .. FONT_COLOR_CODE_CLOSE
                right = HIGHLIGHT_FONT_COLOR_CODE .. (totalcount - count) .. FONT_COLOR_CODE_CLOSE
                tooltip:AddDoubleLine(left, right)
                left = NORMAL_FONT_COLOR_CODE .. "Total" .. FONT_COLOR_CODE_CLOSE
                right = HIGHLIGHT_FONT_COLOR_CODE .. (totalcount) .. FONT_COLOR_CODE_CLOSE
                tooltip:AddDoubleLine(left, right)
            end
        end
    end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, Add_Item_Id)






-- frame that contains the text
local MyScreenMessage = CreateFrame("Frame","ScT",UIParent)
MyScreenMessage:SetSize(720,72)
-- animations will revert to this starting position/alpha
MyScreenMessage:SetPoint("CENTER")
MyScreenMessage:SetAlpha(0)
-- create fontstring to be set that fills frame
MyScreenMessage.text = MyScreenMessage:CreateFontString(nil,"ARTWORK","GameFont72Normal")
MyScreenMessage.text:SetAllPoints(true)

-- set up an AnimationGroup for a related group of animations
MyScreenMessage.anim = MyScreenMessage:CreateAnimationGroup()
-- order 1: fadein alpha 0 to 1
MyScreenMessage.anim.fadein = MyScreenMessage.anim:CreateAnimation("alpha")
MyScreenMessage.anim.fadein:SetFromAlpha(0)
MyScreenMessage.anim.fadein:SetToAlpha(1)
MyScreenMessage.anim.fadein:SetDuration(0.5)
MyScreenMessage.anim.fadein:SetOrder(1)
MyScreenMessage.anim.fadein:SetEndDelay(0.5) -- wait half a second while faded in
-- order 2: fadeout alpha 1 to 0
MyScreenMessage.anim.fadeout = MyScreenMessage.anim:CreateAnimation("alpha")
MyScreenMessage.anim.fadeout:SetFromAlpha(1)
MyScreenMessage.anim.fadeout:SetToAlpha(0)
MyScreenMessage.anim.fadeout:SetDuration(0.25)
MyScreenMessage.anim.fadeout:SetOrder(2)

-- create slash command to show stats

SLASH_STATS1 = "/STATS"

local function GetStatsDistrib()
    local class, classFileName = UnitClass("player")
    local locClass, enClass, classID = UnitClass("player")  local role, globalSpecID, playerRole
    local specId = GetSpecialization()
    if specId then
      globalSpecID,_,_,_,_,role = GetSpecializationInfo(specId)
    end
    
    -- https://wowpedia.fandom.com/wiki/API_GetSpecializationInfo

    -- Death Knight    196 30  58  0.77    0.12    0.23    #C41E3A Red
    -- Demon Hunter    163 48  201 0.64    0.19    0.79    #A330C9 Dark Magenta
    -- Druid           255 124 10  1.00    0.49    0.04    #FF7C0A Orange
    -- Evoker          51  147 127 0.20    0.58    0.50    #33937F Dark Emerald
    -- Hunter          170 211 114 0.67    0.83    0.45    #AAD372 Pistachio
    -- Mage            63  199 235 0.25    0.78    0.92    #3FC7EB Light Blue
    -- Monk            0   255 152 0.00    1.00    0.60    #00FF98 Spring Green
    -- Paladin         244 140 186 0.96    0.55    0.73    #F48CBA Pink
    -- Priest          255 255 255 1.00    1.00    1.00    #FFFFFF White*
    -- Rogue           255 244 104 1.00    0.96    0.41    #FFF468 Yellow*
    -- Shaman          0   112 221 0.00    0.44    0.87    #0070DD Blue
    -- Warlock         135 136 238 0.53    0.53    0.93    #8788EE Purple
    -- Warrior         198 155 109 0.78    0.61    0.43    #C69B6D Tan

    local id = globalSpecID
    local MyStatsText = ''

    -- MyStatsText =  MyStatsText .. id .. "\n"
    if id == 267 then
        -- Destruction Warlock, Haste > Crit > Mastery > Versatility
        MyStatsText =  MyStatsText .. "|cFF8788EE".. class .."|r".. ' (Destruction, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                       .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n"
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/warlock/destruction/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/destruction-warlock/stats-races-and-consumables\n" 
    elseif id == 70 then
        -- Retribution Paladin, Mastery > Haste = Versatility > Crit
        MyStatsText =  MyStatsText .. "|cFFF48CBA".. class .."|r".. ' (Retribution Paladin, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Strength ("  .. UnitStat("player",1)                        .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") ≥ "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") \n  "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/paladin/retribution/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/retribution-paladin/stats-races-and-consumables\n" 
    elseif id == 104 then
        -- Guardian Druid, Versatility > Mastery >= Haste > Crit
        MyStatsText =  MyStatsText .. "|cFFFF7C0A".. class .."|r".. ' (Guardian Druid, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nWhen comparing items of similar ilvl, you can use the following stat priority for defense:\n\n'
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") = "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ")\n"
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/druid/guardian/stat-priority-pve-tank\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/guardian-druid/stats-races-and-consumables\n" 
    elseif id == 105 then
        -- Restoration Druid, Versatility > Mastery >= Haste > Crit
        MyStatsText =  MyStatsText .. "|cFFFF7C0A".. class .."|r".. ' (Restoration Druid, for raiding:, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") = "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") ≥ "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
        MyStatsText =  MyStatsText .. "|cFF".. class .."|r".. ' (Restoration Druid, for m+:, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") >="
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") \n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/druid/restoration/stat-priority-pve-healer\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/restoration-druid/stats-races-and-consumables\n" 
    elseif id == 250 then
        -- Death Knight - Blood, Haste > Versatility > Critical Strike > Mastery
        MyStatsText =  MyStatsText .. "|cFFC41E3A".. class .."|r".. ' (Blood Death Knight, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level overranks all secondary stats. When same item level ranking might be:\n\n'
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") ≥ "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") =  "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") ≥ "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") \n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/death-knight/blood/stat-priority-pve-tank\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/blood-death-knight/stats-races-and-consumables\n" 
    elseif id == 253 then
        -- Beats Mastery Hunter, Critical Strike > Haste > Versatility > Mastery
        MyStatsText =  MyStatsText .. "|cFFAAD372".. class .."|r".. ' (Beats Mastery Hunter, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. "\nSingle Target Stat Priority:\n"
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") ≥ "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
        MyStatsText =  MyStatsText .. "\nAoE Stat Priority:\n"
        MyStatsText =  MyStatsText .. "Agility ("   .. UnitStat("player",2)                        .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") \n "  
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/hunter/beast-mastery/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/beast-mastery-hunter/stats-races-and-consumables\n" 
    elseif id == 266 then
        -- Intellect / Item Level >>> Haste > Mastery = Crit > Versatility
        MyStatsText =  MyStatsText .. "|cFF8788EE".. class .."|r".. ' (Demonology, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be:\n\n'
        MyStatsText =  MyStatsText .. "\nDemonbolt Builds (Sacrificed Souls + Fel Covenant talented):\n"
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") = "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") = "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ")\n "
        MyStatsText =  MyStatsText .. "\nNon-Demonbolt builds:\n"
        MyStatsText =  MyStatsText .. "Intellect (" .. UnitStat("player",4)                        .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/guide/classes/warlock/demonology/stat-priority-pve-dps\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/demonology-warlock/stats-races-and-consumables\n\n" 
    elseif id == 1468 then
        -- Intellect / Item Level >>> Haste > Mastery = Crit > Versatility
        MyStatsText =  MyStatsText .. "|cFF33937F".. class .."|r".. ' (Preservation Evoker, ID ' .. id ..')\n'
        MyStatsText =  MyStatsText .. '\nItem level increases intellect and stamina. When at the same item level the priority should be for raiding:\n\n'
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") > "
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") = "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ")\n "
        MyStatsText =  MyStatsText .. '\nMythic+:\n\n'
        MyStatsText =  MyStatsText .. "Crit ("      .. GetCombatRating(CR_CRIT_SPELL)              .. ") > "
        MyStatsText =  MyStatsText .. "Vers ("      .. GetCombatRating(CR_VERSATILITY_DAMAGE_DONE) .. ") > "
        MyStatsText =  MyStatsText .. "Haste ("     .. GetCombatRating(CR_HASTE_SPELL)             .. ") > "
        MyStatsText =  MyStatsText .. "Mastery ("   .. GetCombatRating(CR_MASTERY)                 .. ") \n "
        MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
        MyStatsText =  MyStatsText .. " https://www.wowhead.com/ptr/guide/classes/evoker/preservation/stat-priority-pve-healer\n" 
        MyStatsText =  MyStatsText .. " https://www.method.gg/guides/preservation-evoker/stats-races-and-consumables\n" 
    else
        MyStatsText =  MyStatsText .. class .. " (not yet implemented)\n" 
    end
    -- MyStatsText =  MyStatsText .. "\nAbove stats for " .. class .. " shown ordered according to:\n" 
    -- MyStatsText =  MyStatsText .. " https://www.wowhead.com/classes\n" 
    -- MyStatsText =  MyStatsText .. " https://www.method.gg/guides)\n" 

    MyStatsText =  MyStatsText .. "\nGeneral stats:\n"
    MyStatsText =  MyStatsText .. "  Strength ("       .. UnitStat("player",1)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Agility ("        .. UnitStat("player",2)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Stamina ("        .. UnitStat("player",3)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Intellect ("      .. UnitStat("player",4)   .. ") \n"
    MyStatsText =  MyStatsText .. "  Maximun Health (" .. UnitHealthMax("player") .. ") \n"

    StatsEditBox_Show(MyStatsText)

end

SlashCmdList["STATS"] = GetStatsDistrib

-- create slash command to toggle selfhiglight

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
    --  Actionbar 1.1   Raid         ElvUI Bar  1        Primary Action Bar 1   OK
    --  Actionbar 1.2   Profession   ElvUI Bar  2        Primary Action Bar 2   > BAR 15
    --  Actionbar 2     Keybinds     ElvUI Bar  6        MultiBarBottomLeft
    --  Actionbar 3     Cooldowns    ElvUI Bar  5        MultiBarBottomRight
    --  Actionbar 4     Keybinds     ElvUI Bar  3        MultiBarRight
    --  Actionbar 5     Keybinds     ElvUI Bar  4        MultiBarLeft
    --  Actionbar 6     Keybinds     ElvUI Bar 13        MultiBar5
    --  Actionbar 7     Keybinds     ElvUI Bar 14        MultiBar6
    --  Actionbar 8     Keybinds     ElvUI Bar 15        MultiBar7

    
-- create funtion to toggle raid actionbars and disable professions bar

local function ToggleMyRaidSet()
    if IsAddOnLoaded("ElvUI") then
        -- ElvUI
        if IsMounted() then     -- just toggle self highlight and action target
            if GetCVar("FindYourselfAnywhere") == "1" then 
                SetCVar("FindYourselfAnywhere", "0")
                 SetCVar("SoftTargetEnemy", "0")        --  0 off, 1 gamepad 2 kbm, 3 always
                 SetCVar("SoftTargetEnemyArc", "1")     --  0 none, 1 in front, 2 in target arrea
            else
                SetCVar("FindYourselfAnywhere", "1")
                SetCVar("SoftTargetEnemy", "3")
                SetCVar("SoftTargetEnemyArc", "1")
            end
        else
            local Bars, BarNumber = {1}, unpack(ElvUI); 
            for _, n in pairs(Bars) do 
                local state = BarNumber.db.actionbar["bar"..n].enabled; 
                BarNumber.db.actionbar["bar"..n].enabled = (state==false and true or false);
                BarNumber.ActionBars:PositionAndSizeBar("bar"..n);
                if BarNumber.db.actionbar["bar"..n].enabled == true then
                    SetCVar("FindYourselfAnywhere", "1")
                    SetCVar("SoftTargetEnemy", "3")
                    SetCVar("SoftTargetEnemyArc", "1")
                    local bars, E = {15}, unpack(ElvUI);
                    E.db.actionbar["bar"..15].enabled = false;
                    E.ActionBars:PositionAndSizeBar("bar"..15);
                else
                    SetCVar("FindYourselfAnywhere", "0")
                    SetCVar("SoftTargetEnemy", "0")
                    SetCVar("SoftTargetEnemyArc", "1")
                end
            end
        end
    else
    -- Blizzard UI
        -- SetCVar("myProfessionBar", "0")
        index = GetActionBarPage()
        if index == 2 then
            if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("1")
            end
            -- SetCVar("myRaidBar", "1")
            SetCVar("FindYourselfAnywhere", "1")
            SetCVar("SoftTargetEnemy", "3")
            SetCVar("SoftTargetEnemyArc", "1")
        else
            if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("2")
            end
            -- SetCVar("myRaidBar", "0")
            SetCVar("FindYourselfAnywhere", "0")
            SetCVar("SoftTargetEnemy", "0")
            SetCVar("SoftTargetEnemyArc", "1")
        end
    end 
end


-- create slash command toggle professions bar, disable raid bar setup

SlashCmdList["MYRAIDSET"] = ToggleMyRaidSet

SLASH_MYPROFESSIONSET1 = "/MYPROFESSIONSET"


local function ToggleMyPROFESSIONSet()
    if IsAddOnLoaded("ElvUI") then
-- ElvUI
        SetCVar("FindYourselfAnywhere", "0")
        SetCVar("SoftTargetEnemy", "0")
        SetCVar("SoftTargetEnemyArc", "1")
        local Bars, BarNumber = {15}, unpack(ElvUI); 
        for _, n in pairs(Bars) do 
            local state = BarNumber.db.actionbar["bar"..n].enabled; 
            BarNumber.db.actionbar["bar"..n].enabled = (state==false and true or false);
            BarNumber.ActionBars:PositionAndSizeBar("bar"..n);
            if BarNumber.db.actionbar["bar"..n].enabled == true then
                local bars, E = {1}, unpack(ElvUI);
                E.db.actionbar["bar"..1].enabled = false;
                E.ActionBars:PositionAndSizeBar("bar"..1);
            -- else
            --     local bars, E = {1}, unpack(ElvUI);
            --     E.db.actionbar["bar"..1].enabled = false;
            --  E.ActionBars:PositionAndSizeBar("bar"..1);
            end
            if IsMounted() then   -- toggle bars
                if BarNumber.db.actionbar["bar"..n].enabled == false then
                    local bars, E = {1}, unpack(ElvUI);
                    E.db.actionbar["bar"..1].enabled = true;
                    E.ActionBars:PositionAndSizeBar("bar"..1);
                end
            end
        end
    else
-- Blizzard UI
        SetCVar("FindYourselfAnywhere", "0")
        index = GetActionBarPage()
        if index == 2 then
            if not UnitAffectingCombat("player") then
                ChangeActionBarPage("1")
            end
        else
            if not UnitAffectingCombat("player") then
                ChangeActionBarPage("2")
            end
        end
        -- if GetCVar("myProfessionBar") == "1" then
        --     ChangeActionBarPage("1") 
        --     -- MultiBar5:Hide() 
        --     SetCVar("myProfessionBar", "0")
        --     SetCVar("myRaidBar", "0")
        --     -- MultiBarBottomRight:Hide()
        -- else
        --     ChangeActionBarPage("2")
        --     -- MultiBar5:Show() 
        --     SetCVar("myProfessionBar", "1")
        --     SetCVar("myRaidBar", "0")
        --     -- MultiBarBottomRight:Hide()
        -- end
    end
end

SlashCmdList["MYPROFESSIONSET"] = ToggleMyPROFESSIONSet

 
function StatsEditBox_Show(text)
    if not StatsEditBox then
        local FrameAijsons = CreateFrame("Frame", "StatsEditBox", UIParent, "DialogBoxFrame")
        FrameAijsons:SetPoint("CENTER")
        FrameAijsons:SetSize(720,480)
        
        FrameAijsons:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            -- edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            edgeSize = 16,
            -- insets = { left = 8, right = 6, top = 8, bottom = 8 },
        })
        -- FrameAijsons:SetBackdropBorderColor(0, .44, .87, 0.5) -- darkblue
        
        -- Movable
        FrameAijsons:SetMovable(true)
        FrameAijsons:SetClampedToScreen(true)
        FrameAijsons:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self:StartMoving()
            end
        end)
        FrameAijsons:SetScript("OnMouseUp", FrameAijsons.StopMovingOrSizing)
        
        -- ScrollFrame
        local ScrollFrameAijsons = CreateFrame("ScrollFrame", "StatsEditBoxScrollFrame", StatsEditBox, "UIPanelScrollFrameTemplate")
        ScrollFrameAijsons:SetPoint("LEFT", 16, 0)
        ScrollFrameAijsons:SetPoint("RIGHT", -32, 0)
        ScrollFrameAijsons:SetPoint("TOP", 0, -16)
        ScrollFrameAijsons:SetPoint("BOTTOM", StatsEditBoxButton, "TOP", 0, 0)
        
        -- EditBox
        local EditBoxAijsons = CreateFrame("EditBox", "StatsEditBoxEditBox", StatsEditBoxScrollFrame)
        EditBoxAijsons:SetSize(ScrollFrameAijsons:GetSize())
        EditBoxAijsons:SetMultiLine(true)
        EditBoxAijsons:SetAutoFocus(false) -- dont automatically focus
        EditBoxAijsons:SetFontObject("ChatFontNormal")
        EditBoxAijsons:SetScript("OnEscapePressed", function() FrameAijsons:Hide() end)
        ScrollFrameAijsons:SetScrollChild(EditBoxAijsons)
        
        -- Resizable
        FrameAijsons:SetResizable(true)
        FrameAijsons:SetResizeBounds(150,100,1280,720)
    
        local ButtonAijsons = CreateFrame("Button", "StatsEditBoxResizeButton", StatsEditBox)
        ButtonAijsons:SetPoint("BOTTOMRIGHT", -6, 7)
        ButtonAijsons:SetSize(16, 16)
        
        ButtonAijsons:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        ButtonAijsons:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        ButtonAijsons:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        
        ButtonAijsons:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                FrameAijsons:StartSizing("BOTTOMRIGHT")
                self:GetHighlightTexture():Hide() -- more noticeable
            end
        end)
        ButtonAijsons:SetScript("OnMouseUp", function(self, button)
            FrameAijsons:StopMovingOrSizing()
            self:GetHighlightTexture():Show()
            EditBoxAijsons:SetWidth(ScrollFrameAijsons:GetWidth())
        end)
        FrameAijsons:Show()
    end
    
    if text then
        StatsEditBoxEditBox:SetText(text)
    end
    StatsEditBox:Show()
end

-- function Aijsons:GetMainFrame(text)
function GetMainFrame(text)
  -- Frame code largely adapted from https://www.wowinterface.com/forums/showpost.php?p=323901&postcount=2
  if not AijsonsFrame then
    -- Main Frame
    local frameConfig = self.db.profile.frame
    local FrameAijsons = CreateFrame("Frame", "AijsonsFrame", UIParent, "DialogBoxFrame")
    FrameAijsons:ClearAllPoints()
    -- load position from local DB
    FrameAijsons:SetPoint(
      frameConfig.point,
      frameConfig.relativeFrame,
      frameConfig.relativePoint,
      frameConfig.ofsx,
      frameConfig.ofsy
    )
    FrameAijsons:SetSize(frameConfig.width, frameConfig.height)
    FrameAijsons:SetBackdrop({
      bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
      edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight",
      edgeSize = 16,
      insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    FrameAijsons:SetMovable(true)
    FrameAijsons:SetClampedToScreen(true)
    FrameAijsons:SetScript("OnMouseDown", function(self, button)
      if button == "LeftButton" then
        self:StartMoving()
      end
    end)
    FrameAijsons:SetScript("OnMouseUp", function(self, button)
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
    local ScrollFrameAijsons = CreateFrame("ScrollFrame", "AijsonsScrollFrame", f, "UIPanelScrollFrameTemplate")
    ScrollFrameAijsons:SetPoint("LEFT", 16, 0)
    ScrollFrameAijsons:SetPoint("RIGHT", -32, 0)
    ScrollFrameAijsons:SetPoint("TOP", 0, -32)
    ScrollFrameAijsons:SetPoint("BOTTOM", AijsonsFrameButton, "TOP", 0, 0)

    -- edit box
    local EditBoxAijsons = CreateFrame("EditBox", "AijsonsEditBox", AijsonsScrollFrame)
    EditBoxAijsons:SetSize(ScrollFrameAijsons:GetSize())
    EditBoxAijsons:SetMultiLine(true)
    EditBoxAijsons:SetAutoFocus(true)
    EditBoxAijsons:SetFontObject("ChatFontNormal")
    EditBoxAijsons:SetScript("OnEscapePressed", function() FrameAijsons:Hide() end)
    ScrollFrameAijsons:SetScrollChild(EditBoxAijsons)

    -- resizing
    FrameAijsons:SetResizable(true)
    FrameAijsons:SetResizeBounds(150, 100)
    local ButtonAijsons = CreateFrame("Button", "AijsonsResizeButton", FrameAijsons)
    ButtonAijsons:SetPoint("BOTTOMRIGHT", -6, 7)
    ButtonAijsons:SetSize(16, 16)

    ButtonAijsons:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    ButtonAijsons:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    ButtonAijsons:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

    ButtonAijsons:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            FrameAijsons:StartSizing("BOTTOMRIGHT")
            self:GetHighlightTexture():Hide() -- more noticeable
        end
    end)
    ButtonAijsons:SetScript("OnMouseUp", function(self, button)
        FrameAijsons:StopMovingOrSizing()
        self:GetHighlightTexture():Show()
        EditBoxAijsons:SetWidth(ScrollFrameAijsons:GetWidth())

        -- save size between sessions
        frameConfig.width = FrameAijsons:GetWidth()
        frameConfig.height = FrameAijsons:GetHeight()
    end)

    AijsonsFrame = f
  end
  AijsonsEditBox:SetText(text)
  AijsonsEditBox:HighlightText()
  return AijsonsFrame
end


-- clamp  name plates above actionbars and hekili

SLASH_MYNAMEPLATES1 = "/MYNAMEPLATES"
SLASH_MYNAMEPLATES2 = "/NP"

local function MyNameplates()
-- Nameplate Settings
    SetCVar("nameplateOtherTopInset", 0.2)
    SetCVar("nameplateOtherBottomInset", 0.28)
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
        if not UnitAffectingCombat("player") then
            index = GetActionBarPage()
            if index == 1 then
                ChangeActionBarPage("3")
            elseif index == 2 then
                ChangeActionBarPage("3")
            elseif index == 3 then
                ChangeActionBarPage("4")
            elseif index == 4 then
                ChangeActionBarPage("5")
            elseif index == 5 then
                ChangeActionBarPage("6")
            else
                ChangeActionBarPage("1")
            end
            -- if GetCVar("myCommandBar") == "1" then
            --     MultiBarBottomLeft:Hide()
            --     MultiBarRight:Hide()
            --     MultiBarLeft:Hide()
            --     SetCVar("myCommandBar", "0")
            -- else
            --     MultiBarBottomLeft:Show()
            --     MultiBarRight:Show()
            --     MultiBarLeft:Show()
            --     SetCVar("myCommandBar", "1")
            -- end
        end
    end
end

SlashCmdList["MYCOMMANDBAR"] = MYCOMMANDBAR

-- MiniMap

SLASH_ROTATEMINIMAP1 = "/ROTATEMINIMAP"
SLASH_ROTATEMINIMAP2 = "/RMM"

local function ROTATEMINIMAP()
    if GetCVar("RotateMinimap") == "1" then
        SetCVar("RotateMinimap",0)
    else
        SetCVar("RotateMinimap",1)
    end
end

SlashCmdList["ROTATEMINIMAP"] = ROTATEMINIMAP


-- create slash command toggle predefined pitch setups


SLASH_MYPITCHSETS1 = "/MYPITCHSETS"
SLASH_MYPITCHSETS2 = "/MPS"

local function MYPITCHSETS()
    if GetCVar("myPitch") == "0" then
        SetCVar("test_cameraDynamicPitch", 1)
        SetCVar("myPitch", 1)
        SetCVar("myPitchSetname", "down")
        SetCVar("nameplateOtherAtBase", 2)  -- 0 over unit, default
        SetCVar("test_cameraDynamicPitchBaseFovPad", 0.4)
        SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.45)
        SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.75)
    elseif GetCVar("myPitch") == "1" then
        SetCVar("test_cameraDynamicPitch", 1)
        SetCVar("myPitch", 2)
        SetCVar("myPitchSetname", "bottom")
        SetCVar("nameplateOtherAtBase", 2)  -- 2 under unit
        SetCVar("test_cameraDynamicPitchBaseFovPad", 0.4)
        SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.65)
        SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.75)
    else 
        SetCVar("test_cameraDynamicPitch", 0)
        SetCVar("myPitch", 0)
        SetCVar("myPitchSetname", "centered")
        SetCVar("nameplateOtherAtBase", 2)  -- 2 under unit
        SetCVar("test_cameraDynamicPitchBaseFovPad", 0.4)
        SetCVar("test_cameraDynamicPitchBaseFovPadDownScale", 0.25)
        SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.75)
    end
    msg = "Pitch " .. GetCVar("myPitchSetname")
    MyScreenMessage.text:SetText(msg)
    MyScreenMessage.anim:Play()
end

SlashCmdList["MYPITCHSETS"] = MYPITCHSETS

-- string_split function cpied from stackoverflow
-- https://stackoverflow.com/questions/1426954/split-string-in-lua#7615129

function string_split(inputstr, sep)
    local inputstr = inputstr .. sep
    local idx, inc, t = 0, 1, {}
    local idx_prev, substr
    repeat 
        idx_prev = idx
        inputstr = strsub(inputstr, idx + 1, -1)    -- chop off the beginning of the string containing the match last found by strfind (or initially, nothing); keep the rest (or initially, all)
        idx = strfind(inputstr, sep)                -- find the 0-based r_index of the first occurrence of separator 
        if idx == nil then break end                -- quit if nothing's found
        substr = strsub(inputstr, 0, idx)           -- extract the substring occurring before the separator (i.e., data field before the next delimiter)
        substr = gsub(substr, sep , "")             -- eliminate control characters, separator and spaces
        t[inc] = substr                             -- store the substring (i.e., data field)
        inc = inc + 1                               -- iterate to next
    until idx == nil 
    return t
end

SLASH_MYMOUNTS1 = "/MYMOUNTS"
SLASH_MYMOUNTS2 = "/MYM"

-- sample macro uasage
--  #showtooltip
--   /cast [swimming,@player]Unending Breath
--   /cast [mod:ctrl]Grand Expedition Yak
--   /MYMOUNTS Cryptic Aurelid,Cliffside Wylderdrake,Honeyback Harvester,Ancient Salamanther

local function MYMOUNTS(INPUTSRING)

    sep = "," 
    InputArray = {}
    InputArray = string_split(INPUTSRING,sep)

    count = 0                                       -- error message to chat if arg count mismatches 4
    for _ in pairs(InputArray) do count = count + 1 end
    if count < 4 then

        print("|cff8788EEAijsons|r missing argument for mymounts\n|cffFFFF00/MYMOUNTS swimming, dragon, flying, groud|r")
        return
    end

    SWIM = InputArray[1]                              
    ADVFLY = InputArray[2] 
    FLY= InputArray[3]
    NOFLY = InputArray[4]

    if IsIndoors() then
        return
    elseif IsSubmerged() then 
        if IsMounted() then   
            if IsFlyableArea() then
                CastSpellByName(FLY)            -- if already mounted mount to flyable mount 
            elseif IsAdvancedFlyableArea() then
                CastSpellByName(ADVFLY)         -- or dragonride mount 
                -- ChangeActionBarPage("1")
                if IsAddOnLoaded("ElvUI") then
                    -- ElvUI
                    -- show actionbar for dragonriding
                    local bars, E = {1}, unpack(ElvUI);
                    E.db.actionbar["bar".. 1].enabled = true;
                    E.ActionBars:PositionAndSizeBar("bar" .. 1);
                    local bars, E = {15}, unpack(ElvUI);
                    E.db.actionbar["bar".. 15].enabled = false;
                    E.ActionBars:PositionAndSizeBar("bar" .. 15);
                else
                    -- Blizzard UI
                    if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("1")
                    end
                end
            else
                Dismount()
                if IsAddOnLoaded("ElvUI") then
                 -- ElvUI
                local bars, E = {1}, unpack(ElvUI);
                if GetCVar("FindYourselfAnywhere") == "1" then  -- Raidbar visible if raid selfhiglight on
                    E.db.actionbar["bar".. 1].enabled = true;
                else
                    E.db.actionbar["bar".. 1].enabled = false;
                end
                E.ActionBars:PositionAndSizeBar("bar" .. 1);
                local bars, E = {15}, unpack(ElvUI);            -- Professions off
                E.db.actionbar["bar".. 15].enabled = false;
                E.ActionBars:PositionAndSizeBar("bar" .. 15);
                else
                    -- Blizzard UI
                    if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("1")
                    end
                end
            end
        else
            CastSpellByName(SWIM)               -- cast swimming mount 
        end
    elseif IsMounted() then
        if IsFlying() then                      -- if flying do not dismount :D
            return 
        else
            Dismount()
            if IsAddOnLoaded("ElvUI") then
                 -- ElvUI
                local bars, E = {1}, unpack(ElvUI);
                if GetCVar("FindYourselfAnywhere") == "1" then  -- Raidbar visible if raid selfhiglight on
                    E.db.actionbar["bar".. 1].enabled = true;
                else
                    E.db.actionbar["bar".. 1].enabled = false;
                end
                E.ActionBars:PositionAndSizeBar("bar" .. 1);
                local bars, E = {15}, unpack(ElvUI);            -- Professions off
                E.db.actionbar["bar".. 15].enabled = false;
                E.ActionBars:PositionAndSizeBar("bar" .. 15);
            else
                -- Blizzard UI
                if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("1")
                end
            end
        end
    elseif IsFlyableArea() then
        CastSpellByName(FLY)                    -- regular flyable
    elseif IsAdvancedFlyableArea() then
        CastSpellByName(ADVFLY)                 -- or dragonride mount, change actionbar page
        -- ChangeActionBarPage("1")
        if IsAddOnLoaded("ElvUI") then
            -- ElvUI
            local bars, E = {1}, unpack(ElvUI);
            E.db.actionbar["bar".. 1].enabled = true;
            E.ActionBars:PositionAndSizeBar("bar" .. 1);
            local bars, E = {15}, unpack(ElvUI);
            E.db.actionbar["bar".. 15].enabled = false;
            E.ActionBars:PositionAndSizeBar("bar" .. 15);
            else
                -- Blizzard UI
                if not UnitAffectingCombat("player") then
                        ChangeActionBarPage("1")
                end
            end
    else
        CastSpellByName(NOFLY)                  -- noflyable  
    end
end

SlashCmdList["MYMOUNTS"] = MYMOUNTS


-- create slash command to toggle Haldu's Dragonflight Helper framed to actionbar bar 15
-- obsolete, WA visibilty toggle bound to objevtive frames  (ObjectiveTrackerBlocksFrame)

-- SLASH_MYWEEKLYS1 = "/MYWEEKLYS"

-- local function ToggleMyWeelys()
--     if IsAddOnLoaded("ElvUI") then
-- -- ElvUI
--         local Bars, BarNumber = {15}, unpack(ElvUI); 
--         for _, n in pairs(Bars) do 
--             local state = BarNumber.db.actionbar["bar"..n].enabled; 
--             BarNumber.db.actionbar["bar"..n].enabled = (state==false and true or false);
--             BarNumber.ActionBars:PositionAndSizeBar("bar"..n);
--         end
--     else
--         -- if GetCVar("myWeeklies") == "1" then
--         --     MultiBar7:Hide() 
--         --     SetCVar("myWeeklies", "0")
--         -- else
--         --     MultiBar7:Show() 
--         --     SetCVar("myWeeklies", "1")
--         -- end
--     end
-- end
-- SlashCmdList["MYWEEKLYS"] = ToggleMyWeelys
-- edit box with class stats