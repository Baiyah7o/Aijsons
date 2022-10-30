local LSM3 = LibStub("LibSharedMedia-3.0", true)
local LSM2 = LibStub("LibSharedMedia-2.0", true)
local SML = LibStub("SharedMedia-1.0", true)

local LSM3 = LibStub("LibSharedMedia-3.0", true)
local LSM2 = LibStub("LibSharedMedia-2.0", true)
local SML = LibStub("SharedMedia-1.0", true)

Aysons = {}

Aysons.registry = { ["font"] = {} }

function Aysons:Register(mediatype, key, data, langmask)
	if LSM3 then
		LSM3:Register(mediatype, key, data, langmask)
	end
	if LSM2 then
		LSM2:Register(mediatype, key, data)
	end
	if SML then
		SML:Register(mediatype, key, data)
	end
	if not Aysons.registry[mediatype] then
		Aysons.registry[mediatype] = {}
	end
	table.insert(Aysons.registry[mediatype], { key, data, langmask})
end

function Aysons.OnEvent(this, event, ...)
	if not LSM3 then
		LSM3 = LibStub("LibSharedMedia-3.0", true)
		if LSM3 then
			for m,t in pairs(Aysons.registry) do
				for _,v in ipairs(t) do
					LSM3:Register(m, v[1], v[2], v[3])
				end
			end
		end
	end
	if not LSM2 then
		LSM2 = LibStub("LibSharedMedia-2.0", true)
		if LSM2 then
			for m,t in pairs(Aysons.registry) do
				for _,v in ipairs(t) do
					LSM2:Register(m, v[1], v[2])
				end
			end
		end
	end
	if not SML then
		SML = LibStub("SharedMedia-1.0", true)
		if SML then
			for m,t in pairs(Aysons.registry) do
				for _,v in ipairs(t) do
					SML:Register(m, v[1], v[2])
				end
			end
		end
	end
end

Aysons.frame = CreateFrame("Frame")
Aysons.frame:SetScript("OnEvent", Aysons.OnEvent)
Aysons.frame:RegisterEvent("ADDON_LOADED")


--[[

----
---- PLEASE READ BEFORE DOING ANYTHING ----
----

Only fonts should be added to this addon. If you wish to add textures, sounds, ... create your own addon or use an existing one if there is one.
All fonts must be able to display special characters such as é, è, à, ü, É, Ç, ... Remember that not all the users use the English client!

Don't add a font that you did not test. All fonts must be tested in game before upload.

Thanks for your cooperation! ;-)
pb_ee1

]]

-- registrations for media from the client itself belongs in LibSharedMedia-3.0

if not Aysons then return end

-- -----
-- FONT
-- -----

Aysons:Register("font", "Cantarell Bold", [[Interface\Addons\Aysons\Fonts\Cantarell-Bold.otf]])
Aysons:Register("font", "Cantarell ExtraBold", [[Interface\Addons\Aysons\Fonts\Cantarell-ExtraBold.otf]])
Aysons:Register("font", "Cantarell Light", [[Interface\Addons\Aysons\Fonts\Cantarell-Light.otf]])
Aysons:Register("font", "Cantarell Regular", [[Interface\Addons\Aysons\Fonts\Cantarell-Regular.otf]])
Aysons:Register("font", "Cantarell Thin", [[Interface\Addons\Aysons\Fonts\Cantarell-Thin.otf]])
Aysons:Register("font", "Cantarell VF", [[Interface\Addons\Aysons\Fonts\Cantarell-VF.otf]])

Aysons:Register("statusbar", "Flat", [[Interface\Addons\Aysons\Statusbar\flat.tga]])

Aysons:Register("sound", "Aysons, 1", [[Interface\Addons\Aysons\Sound\1.ogg]]) 
Aysons:Register("sound", "Aysons, 10", [[Interface\Addons\Aysons\Sound\10.ogg]]) 
Aysons:Register("sound", "Aysons, 2", [[Interface\Addons\Aysons\Sound\2.ogg]]) 
Aysons:Register("sound", "Aysons, 3", [[Interface\Addons\Aysons\Sound\3.ogg]]) 
Aysons:Register("sound", "Aysons, 4", [[Interface\Addons\Aysons\Sound\4.ogg]]) 
Aysons:Register("sound", "Aysons, 5", [[Interface\Addons\Aysons\Sound\5.ogg]]) 
Aysons:Register("sound", "Aysons, 6", [[Interface\Addons\Aysons\Sound\6.ogg]]) 
Aysons:Register("sound", "Aysons, 7", [[Interface\Addons\Aysons\Sound\7.ogg]]) 
Aysons:Register("sound", "Aysons, 8", [[Interface\Addons\Aysons\Sound\8.ogg]]) 
Aysons:Register("sound", "Aysons, 9", [[Interface\Addons\Aysons\Sound\9.ogg]]) 
Aysons:Register("sound", "Aysons, Add", [[Interface\Addons\Aysons\Sound\Add.ogg]]) 
Aysons:Register("sound", "Aysons, Adds", [[Interface\Addons\Aysons\Sound\Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Avoid", [[Interface\Addons\Aysons\Sound\Avoid.ogg]]) 
Aysons:Register("sound", "Aysons, Backup", [[Interface\Addons\Aysons\Sound\Backup.ogg]]) 
Aysons:Register("sound", "Aysons, Bait", [[Interface\Addons\Aysons\Sound\Bait.ogg]]) 
Aysons:Register("sound", "Aysons, Beam", [[Interface\Addons\Aysons\Sound\Beam.ogg]]) 
Aysons:Register("sound", "Aysons, Behind", [[Interface\Addons\Aysons\Sound\Behind.ogg]]) 
Aysons:Register("sound", "Aysons, Bloodlust", [[Interface\Addons\Aysons\Sound\Bloodlust.ogg]]) 
Aysons:Register("sound", "Aysons, Blue", [[Interface\Addons\Aysons\Sound\Blue.ogg]]) 
Aysons:Register("sound", "Aysons, Bomb", [[Interface\Addons\Aysons\Sound\Bomb.ogg]]) 
Aysons:Register("sound", "Aysons, Boss Immune", [[Interface\Addons\Aysons\Sound\Boss Immune.ogg]]) 
Aysons:Register("sound", "Aysons, Bottom", [[Interface\Addons\Aysons\Sound\Bottom.ogg]]) 
Aysons:Register("sound", "Aysons, Break Tether", [[Interface\Addons\Aysons\Sound\Break Tether.ogg]]) 
Aysons:Register("sound", "Aysons, Break", [[Interface\Addons\Aysons\Sound\Break.ogg]]) 
Aysons:Register("sound", "Aysons, Buff", [[Interface\Addons\Aysons\Sound\Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Caution", [[Interface\Addons\Aysons\Sound\Caution.ogg]]) 
Aysons:Register("sound", "Aysons, CC", [[Interface\Addons\Aysons\Sound\CC.ogg]]) 
Aysons:Register("sound", "Aysons, Centre", [[Interface\Addons\Aysons\Sound\Centre.ogg]]) 
Aysons:Register("sound", "Aysons, Chain", [[Interface\Addons\Aysons\Sound\Chain.ogg]]) 
Aysons:Register("sound", "Aysons, Circle on You", [[Interface\Addons\Aysons\Sound\Circle on You.ogg]]) 
Aysons:Register("sound", "Aysons, Circle", [[Interface\Addons\Aysons\Sound\Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Clear", [[Interface\Addons\Aysons\Sound\Clear.ogg]]) 
Aysons:Register("sound", "Aysons, Collect", [[Interface\Addons\Aysons\Sound\Collect.ogg]]) 
Aysons:Register("sound", "Aysons, Completed", [[Interface\Addons\Aysons\Sound\Completed.ogg]]) 
Aysons:Register("sound", "Aysons, Crit Buff", [[Interface\Addons\Aysons\Sound\Crit Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Cross on You", [[Interface\Addons\Aysons\Sound\Cross on You.ogg]]) 
Aysons:Register("sound", "Aysons, Cross", [[Interface\Addons\Aysons\Sound\Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Dance", [[Interface\Addons\Aysons\Sound\Dance.ogg]]) 
Aysons:Register("sound", "Aysons, Debuff Avoid", [[Interface\Addons\Aysons\Sound\Debuff Avoid.ogg]]) 
Aysons:Register("sound", "Aysons, Debuff", [[Interface\Addons\Aysons\Sound\Debuff.ogg]]) 
Aysons:Register("sound", "Aysons, Diamond on You", [[Interface\Addons\Aysons\Sound\Diamond on You.ogg]]) 
Aysons:Register("sound", "Aysons, Diamond", [[Interface\Addons\Aysons\Sound\Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Dispell", [[Interface\Addons\Aysons\Sound\Dispell.ogg]]) 
Aysons:Register("sound", "Aysons, Dodge", [[Interface\Addons\Aysons\Sound\Dodge.ogg]]) 
Aysons:Register("sound", "Aysons, Don't Move", [[Interface\Addons\Aysons\Sound\Don't Move.ogg]]) 
Aysons:Register("sound", "Aysons, Don't Release", [[Interface\Addons\Aysons\Sound\Don't Release.ogg]]) 
Aysons:Register("sound", "Aysons, DPS Mind Controlled", [[Interface\Addons\Aysons\Sound\DPS Mind Controlled.ogg]]) 
Aysons:Register("sound", "Aysons, DPS", [[Interface\Addons\Aysons\Sound\DPS.ogg]]) 
Aysons:Register("sound", "Aysons, Drop Edges", [[Interface\Addons\Aysons\Sound\Drop Edges.ogg]]) 
Aysons:Register("sound", "Aysons, Drop", [[Interface\Addons\Aysons\Sound\Drop.ogg]]) 
Aysons:Register("sound", "Aysons, Edge", [[Interface\Addons\Aysons\Sound\Edge.ogg]]) 
Aysons:Register("sound", "Aysons, Eggs", [[Interface\Addons\Aysons\Sound\Eggs.ogg]]) 
Aysons:Register("sound", "Aysons, Escort", [[Interface\Addons\Aysons\Sound\Escort.ogg]]) 
Aysons:Register("sound", "Aysons, Execute Mind Control", [[Interface\Addons\Aysons\Sound\Execute Mind Control.ogg]]) 
Aysons:Register("sound", "Aysons, Execute", [[Interface\Addons\Aysons\Sound\Execute.ogg]]) 
Aysons:Register("sound", "Aysons, Exit", [[Interface\Addons\Aysons\Sound\Exit.ogg]]) 
Aysons:Register("sound", "Aysons, Face Away", [[Interface\Addons\Aysons\Sound\Face Away.ogg]]) 
Aysons:Register("sound", "Aysons, Find Partner", [[Interface\Addons\Aysons\Sound\Find Partner.ogg]]) 
Aysons:Register("sound", "Aysons, Fixate", [[Interface\Addons\Aysons\Sound\Fixate.ogg]]) 
Aysons:Register("sound", "Aysons, Fixated", [[Interface\Addons\Aysons\Sound\Fixated.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Add", [[Interface\Addons\Aysons\Sound\Focus Add.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Adds", [[Interface\Addons\Aysons\Sound\Focus Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Boss", [[Interface\Addons\Aysons\Sound\Focus Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal 180", [[Interface\Addons\Aysons\Sound\Frontal 180.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal Cone", [[Interface\Addons\Aysons\Sound\Frontal Cone.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal", [[Interface\Addons\Aysons\Sound\Frontal.ogg]]) 
Aysons:Register("sound", "Aysons, Gate", [[Interface\Addons\Aysons\Sound\Gate.ogg]]) 
Aysons:Register("sound", "Aysons, Gather", [[Interface\Addons\Aysons\Sound\Gather.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Circle", [[Interface\Addons\Aysons\Sound\Go to Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Cross", [[Interface\Addons\Aysons\Sound\Go to Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Diamond", [[Interface\Addons\Aysons\Sound\Go to Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Moon", [[Interface\Addons\Aysons\Sound\Go to Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Skull", [[Interface\Addons\Aysons\Sound\Go to Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Square", [[Interface\Addons\Aysons\Sound\Go to Square.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Star", [[Interface\Addons\Aysons\Sound\Go to Star.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Triangle", [[Interface\Addons\Aysons\Sound\Go to Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Goodbye", [[Interface\Addons\Aysons\Sound\Goodbye.ogg]]) 
Aysons:Register("sound", "Aysons, Green", [[Interface\Addons\Aysons\Sound\Green.ogg]]) 
Aysons:Register("sound", "Aysons, Group 1", [[Interface\Addons\Aysons\Sound\Group 1.ogg]]) 
Aysons:Register("sound", "Aysons, Group 2", [[Interface\Addons\Aysons\Sound\Group 2.ogg]]) 
Aysons:Register("sound", "Aysons, Group 3", [[Interface\Addons\Aysons\Sound\Group 3.ogg]]) 
Aysons:Register("sound", "Aysons, Group 4", [[Interface\Addons\Aysons\Sound\Group 4.ogg]]) 
Aysons:Register("sound", "Aysons, Group 5", [[Interface\Addons\Aysons\Sound\Group 5.ogg]]) 
Aysons:Register("sound", "Aysons, Group A", [[Interface\Addons\Aysons\Sound\Group A.ogg]]) 
Aysons:Register("sound", "Aysons, Group B", [[Interface\Addons\Aysons\Sound\Group B.ogg]]) 
Aysons:Register("sound", "Aysons, Group C", [[Interface\Addons\Aysons\Sound\Group C.ogg]]) 
Aysons:Register("sound", "Aysons, Group D", [[Interface\Addons\Aysons\Sound\Group D.ogg]]) 
Aysons:Register("sound", "Aysons, Haste Buff", [[Interface\Addons\Aysons\Sound\Haste Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Heal Cd", [[Interface\Addons\Aysons\Sound\Heal Cd.ogg]]) 
Aysons:Register("sound", "Aysons, Healer", [[Interface\Addons\Aysons\Sound\Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Healthstone", [[Interface\Addons\Aysons\Sound\Healthstone.ogg]]) 
Aysons:Register("sound", "Aysons, Hero", [[Interface\Addons\Aysons\Sound\Hero.ogg]]) 
Aysons:Register("sound", "Aysons, Heroism", [[Interface\Addons\Aysons\Sound\Heroism.ogg]]) 
Aysons:Register("sound", "Aysons, Hide", [[Interface\Addons\Aysons\Sound\Hide.ogg]]) 
Aysons:Register("sound", "Aysons, High Energy", [[Interface\Addons\Aysons\Sound\High Energy.ogg]]) 
Aysons:Register("sound", "Aysons, High Stacks", [[Interface\Addons\Aysons\Sound\High Stacks.ogg]]) 
Aysons:Register("sound", "Aysons, High", [[Interface\Addons\Aysons\Sound\High.ogg]]) 
Aysons:Register("sound", "Aysons, Immune", [[Interface\Addons\Aysons\Sound\Immune.ogg]]) 
Aysons:Register("sound", "Aysons, Immunity", [[Interface\Addons\Aysons\Sound\Immunity.ogg]]) 
Aysons:Register("sound", "Aysons, In", [[Interface\Addons\Aysons\Sound\In.ogg]]) 
Aysons:Register("sound", "Aysons, Inside", [[Interface\Addons\Aysons\Sound\Inside.ogg]]) 
Aysons:Register("sound", "Aysons, Interrupt", [[Interface\Addons\Aysons\Sound\Interrupt.ogg]]) 
Aysons:Register("sound", "Aysons, Invisibility", [[Interface\Addons\Aysons\Sound\Invisibility.ogg]]) 
Aysons:Register("sound", "Aysons, Jump", [[Interface\Addons\Aysons\Sound\Jump.ogg]]) 
Aysons:Register("sound", "Aysons, Kite", [[Interface\Addons\Aysons\Sound\Kite.ogg]]) 
Aysons:Register("sound", "Aysons, Knock", [[Interface\Addons\Aysons\Sound\Knock.ogg]]) 
Aysons:Register("sound", "Aysons, Left", [[Interface\Addons\Aysons\Sound\Left.ogg]]) 
Aysons:Register("sound", "Aysons, Line of Sight", [[Interface\Addons\Aysons\Sound\Line of Sight.ogg]]) 
Aysons:Register("sound", "Aysons, Linked", [[Interface\Addons\Aysons\Sound\Linked.ogg]]) 
Aysons:Register("sound", "Aysons, Lock Gate", [[Interface\Addons\Aysons\Sound\Lock Gate.ogg]]) 
Aysons:Register("sound", "Aysons, Lock Rock", [[Interface\Addons\Aysons\Sound\Lock Rock.ogg]]) 
Aysons:Register("sound", "Aysons, Loose Stack", [[Interface\Addons\Aysons\Sound\Loose Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Low Health", [[Interface\Addons\Aysons\Sound\Low Health.ogg]]) 
Aysons:Register("sound", "Aysons, Low Mana", [[Interface\Addons\Aysons\Sound\Low Mana.ogg]]) 
Aysons:Register("sound", "Aysons, Low Sanity", [[Interface\Addons\Aysons\Sound\Low Sanity.ogg]]) 
Aysons:Register("sound", "Aysons, Low", [[Interface\Addons\Aysons\Sound\Low.ogg]]) 
Aysons:Register("sound", "Aysons, Melee", [[Interface\Addons\Aysons\Sound\Melee.ogg]]) 
Aysons:Register("sound", "Aysons, Mind Control", [[Interface\Addons\Aysons\Sound\Mind Control.ogg]]) 
Aysons:Register("sound", "Aysons, Mines", [[Interface\Addons\Aysons\Sound\Mines.ogg]]) 
Aysons:Register("sound", "Aysons, Misdirect", [[Interface\Addons\Aysons\Sound\Misdirect.ogg]]) 
Aysons:Register("sound", "Aysons, Moon on You", [[Interface\Addons\Aysons\Sound\Moon on You.ogg]]) 
Aysons:Register("sound", "Aysons, Moon", [[Interface\Addons\Aysons\Sound\Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Move Apart", [[Interface\Addons\Aysons\Sound\Move Apart.ogg]]) 
Aysons:Register("sound", "Aysons, Move as One", [[Interface\Addons\Aysons\Sound\Move as One.ogg]]) 
Aysons:Register("sound", "Aysons, Move Far", [[Interface\Addons\Aysons\Sound\Move Far.ogg]]) 
Aysons:Register("sound", "Aysons, Move Max Range", [[Interface\Addons\Aysons\Sound\Move Max Range.ogg]]) 
Aysons:Register("sound", "Aysons, Move Out", [[Interface\Addons\Aysons\Sound\Move Out.ogg]]) 
Aysons:Register("sound", "Aysons, Move Together", [[Interface\Addons\Aysons\Sound\Move Together.ogg]]) 
Aysons:Register("sound", "Aysons, Move", [[Interface\Addons\Aysons\Sound\Move.ogg]]) 
Aysons:Register("sound", "Aysons, Next", [[Interface\Addons\Aysons\Sound\Next.ogg]]) 
Aysons:Register("sound", "Aysons, Now", [[Interface\Addons\Aysons\Sound\Now.ogg]]) 
Aysons:Register("sound", "Aysons, Ocean", [[Interface\Addons\Aysons\Sound\Ocean.ogg]]) 
Aysons:Register("sound", "Aysons, Orange", [[Interface\Addons\Aysons\Sound\Orange.ogg]]) 
Aysons:Register("sound", "Aysons, Orb", [[Interface\Addons\Aysons\Sound\Orb.ogg]]) 
Aysons:Register("sound", "Aysons, Out", [[Interface\Addons\Aysons\Sound\Out.ogg]]) 
Aysons:Register("sound", "Aysons, Outside", [[Interface\Addons\Aysons\Sound\Outside.ogg]]) 
Aysons:Register("sound", "Aysons, Overlap", [[Interface\Addons\Aysons\Sound\Overlap.ogg]]) 
Aysons:Register("sound", "Aysons, Personal", [[Interface\Addons\Aysons\Sound\Personal.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 1", [[Interface\Addons\Aysons\Sound\Phase 1.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 2", [[Interface\Addons\Aysons\Sound\Phase 2.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 3", [[Interface\Addons\Aysons\Sound\Phase 3.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 4", [[Interface\Addons\Aysons\Sound\Phase 4.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 5", [[Interface\Addons\Aysons\Sound\Phase 5.ogg]]) 
Aysons:Register("sound", "Aysons, Pillar", [[Interface\Addons\Aysons\Sound\Pillar.ogg]]) 
Aysons:Register("sound", "Aysons, Poison", [[Interface\Addons\Aysons\Sound\Poison.ogg]]) 
Aysons:Register("sound", "Aysons, Pool", [[Interface\Addons\Aysons\Sound\Pool.ogg]]) 
Aysons:Register("sound", "Aysons, Pots", [[Interface\Addons\Aysons\Sound\Pots.ogg]]) 
Aysons:Register("sound", "Aysons, Pre Pot", [[Interface\Addons\Aysons\Sound\Pre Pot.ogg]]) 
Aysons:Register("sound", "Aysons, Puddle", [[Interface\Addons\Aysons\Sound\Puddle.ogg]]) 
Aysons:Register("sound", "Aysons, Purge", [[Interface\Addons\Aysons\Sound\Purge.ogg]]) 
Aysons:Register("sound", "Aysons, Purple", [[Interface\Addons\Aysons\Sound\Purple.ogg]]) 
Aysons:Register("sound", "Aysons, Ranged", [[Interface\Addons\Aysons\Sound\Ranged.ogg]]) 
Aysons:Register("sound", "Aysons, Ready", [[Interface\Addons\Aysons\Sound\Ready.ogg]]) 
Aysons:Register("sound", "Aysons, Red", [[Interface\Addons\Aysons\Sound\Red.ogg]]) 
Aysons:Register("sound", "Aysons, Reflecting Damage", [[Interface\Addons\Aysons\Sound\Reflecting Damage.ogg]]) 
Aysons:Register("sound", "Aysons, Ress Healer", [[Interface\Addons\Aysons\Sound\Ress Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Ress Tank", [[Interface\Addons\Aysons\Sound\Ress Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Ress", [[Interface\Addons\Aysons\Sound\Ress.ogg]]) 
Aysons:Register("sound", "Aysons, Right", [[Interface\Addons\Aysons\Sound\Right.ogg]]) 
Aysons:Register("sound", "Aysons, Roof Beams", [[Interface\Addons\Aysons\Sound\Roof Beams.ogg]]) 
Aysons:Register("sound", "Aysons, Sanity", [[Interface\Addons\Aysons\Sound\Sanity.ogg]]) 
Aysons:Register("sound", "Aysons, Scatter", [[Interface\Addons\Aysons\Sound\Scatter.ogg]]) 
Aysons:Register("sound", "Aysons, Self Cd", [[Interface\Addons\Aysons\Sound\Self Cd.ogg]]) 
Aysons:Register("sound", "Aysons, Share Absorb", [[Interface\Addons\Aysons\Sound\Share Absorb.ogg]]) 
Aysons:Register("sound", "Aysons, Share Damage", [[Interface\Addons\Aysons\Sound\Share Damage.ogg]]) 
Aysons:Register("sound", "Aysons, Share Soak", [[Interface\Addons\Aysons\Sound\Share Soak.ogg]]) 
Aysons:Register("sound", "Aysons, Share", [[Interface\Addons\Aysons\Sound\Share.ogg]]) 
Aysons:Register("sound", "Aysons, Shroud", [[Interface\Addons\Aysons\Sound\Shroud.ogg]]) 
Aysons:Register("sound", "Aysons, Side Beams", [[Interface\Addons\Aysons\Sound\Side Beams.ogg]]) 
Aysons:Register("sound", "Aysons, Side", [[Interface\Addons\Aysons\Sound\Side.ogg]]) 
Aysons:Register("sound", "Aysons, Skull on You", [[Interface\Addons\Aysons\Sound\Skull on You.ogg]]) 
Aysons:Register("sound", "Aysons, Skull", [[Interface\Addons\Aysons\Sound\Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Soak", [[Interface\Addons\Aysons\Sound\Soak.ogg]]) 
Aysons:Register("sound", "Aysons, Solo", [[Interface\Addons\Aysons\Sound\Solo.ogg]]) 
Aysons:Register("sound", "Aysons, Soon", [[Interface\Addons\Aysons\Sound\Soon.ogg]]) 
Aysons:Register("sound", "Aysons, Spell Steal", [[Interface\Addons\Aysons\Sound\Spell Steal.ogg]]) 
Aysons:Register("sound", "Aysons, Spikes", [[Interface\Addons\Aysons\Sound\Spikes.ogg]]) 
Aysons:Register("sound", "Aysons, Spread", [[Interface\Addons\Aysons\Sound\Spread.ogg]]) 
Aysons:Register("sound", "Aysons, Square on You", [[Interface\Addons\Aysons\Sound\Square on You.ogg]]) 
Aysons:Register("sound", "Aysons, Square", [[Interface\Addons\Aysons\Sound\Square.ogg]]) 
Aysons:Register("sound", "Aysons, Stack behind Boss", [[Interface\Addons\Aysons\Sound\Stack behind Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Stack beside Boss", [[Interface\Addons\Aysons\Sound\Stack beside Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Healer", [[Interface\Addons\Aysons\Sound\Stack on Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Melee", [[Interface\Addons\Aysons\Sound\Stack on Melee.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Ranged", [[Interface\Addons\Aysons\Sound\Stack on Ranged.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Tank", [[Interface\Addons\Aysons\Sound\Stack on Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on", [[Interface\Addons\Aysons\Sound\Stack on.ogg]]) 
Aysons:Register("sound", "Aysons, Stack", [[Interface\Addons\Aysons\Sound\Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Stairs", [[Interface\Addons\Aysons\Sound\Stairs.ogg]]) 
Aysons:Register("sound", "Aysons, Star on You", [[Interface\Addons\Aysons\Sound\Star on You.ogg]]) 
Aysons:Register("sound", "Aysons, Star", [[Interface\Addons\Aysons\Sound\Star.ogg]]) 
Aysons:Register("sound", "Aysons, Stop Moving", [[Interface\Addons\Aysons\Sound\Stop Moving.ogg]]) 
Aysons:Register("sound", "Aysons, Stop", [[Interface\Addons\Aysons\Sound\Stop.ogg]]) 
Aysons:Register("sound", "Aysons, Stopcast", [[Interface\Addons\Aysons\Sound\Stopcast.ogg]]) 
Aysons:Register("sound", "Aysons, Storm", [[Interface\Addons\Aysons\Sound\Storm.ogg]]) 
Aysons:Register("sound", "Aysons, Suicide", [[Interface\Addons\Aysons\Sound\Suicide.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Adds", [[Interface\Addons\Aysons\Sound\Switch to Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Boss", [[Interface\Addons\Aysons\Sound\Switch to Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Circle", [[Interface\Addons\Aysons\Sound\Switch to Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Cross", [[Interface\Addons\Aysons\Sound\Switch to Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Diamond", [[Interface\Addons\Aysons\Sound\Switch to Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Moon", [[Interface\Addons\Aysons\Sound\Switch to Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Skull", [[Interface\Addons\Aysons\Sound\Switch to Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Square", [[Interface\Addons\Aysons\Sound\Switch to Square.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Star", [[Interface\Addons\Aysons\Sound\Switch to Star.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Triangle", [[Interface\Addons\Aysons\Sound\Switch to Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to", [[Interface\Addons\Aysons\Sound\Switch to.ogg]]) 
Aysons:Register("sound", "Aysons, Switch", [[Interface\Addons\Aysons\Sound\Switch.ogg]]) 
Aysons:Register("sound", "Aysons, Tank", [[Interface\Addons\Aysons\Sound\Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Targeted", [[Interface\Addons\Aysons\Sound\Targeted.ogg]]) 
Aysons:Register("sound", "Aysons, Taunt", [[Interface\Addons\Aysons\Sound\Taunt.ogg]]) 
Aysons:Register("sound", "Aysons, Tethered", [[Interface\Addons\Aysons\Sound\Tethered.ogg]]) 
Aysons:Register("sound", "Aysons, Tight Stack", [[Interface\Addons\Aysons\Sound\Tight Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Top", [[Interface\Addons\Aysons\Sound\Top.ogg]]) 
Aysons:Register("sound", "Aysons, Transistion", [[Interface\Addons\Aysons\Sound\Transistion.ogg]]) 
Aysons:Register("sound", "Aysons, Triangle on You", [[Interface\Addons\Aysons\Sound\Triangle on You.ogg]]) 
Aysons:Register("sound", "Aysons, Triangle", [[Interface\Addons\Aysons\Sound\Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Turn Around", [[Interface\Addons\Aysons\Sound\Turn Around.ogg]]) 
Aysons:Register("sound", "Aysons, Turn", [[Interface\Addons\Aysons\Sound\Turn.ogg]]) 
Aysons:Register("sound", "Aysons, Use Cloak", [[Interface\Addons\Aysons\Sound\Use Cloak.ogg]]) 
Aysons:Register("sound", "Aysons, Use", [[Interface\Addons\Aysons\Sound\Use.ogg]]) 
Aysons:Register("sound", "Aysons, Void", [[Interface\Addons\Aysons\Sound\Void.ogg]]) 
Aysons:Register("sound", "Aysons, Yellow", [[Interface\Addons\Aysons\Sound\Yellow.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ1 ", [[Interface\Addons\Aysons\Sound\ZZ1 .ogg]]) 
Aysons:Register("sound", "Aysons, ZZ10", [[Interface\Addons\Aysons\Sound\ZZ10.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ2", [[Interface\Addons\Aysons\Sound\ZZ2.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ3", [[Interface\Addons\Aysons\Sound\ZZ3.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ4", [[Interface\Addons\Aysons\Sound\ZZ4.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ5", [[Interface\Addons\Aysons\Sound\ZZ5.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ6", [[Interface\Addons\Aysons\Sound\ZZ6.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ7", [[Interface\Addons\Aysons\Sound\ZZ7.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ8", [[Interface\Addons\Aysons\Sound\ZZ8.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ9", [[Interface\Addons\Aysons\Sound\ZZ9.ogg]])