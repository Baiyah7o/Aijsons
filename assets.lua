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

Aysons:Register("sound", "Aysons, 1", [[Interface\Addons\Aysons\sound\1.ogg]]) 
Aysons:Register("sound", "Aysons, 10", [[Interface\Addons\Aysons\sound\10.ogg]]) 
Aysons:Register("sound", "Aysons, 2", [[Interface\Addons\Aysons\sound\2.ogg]]) 
Aysons:Register("sound", "Aysons, 3", [[Interface\Addons\Aysons\sound\3.ogg]]) 
Aysons:Register("sound", "Aysons, 4", [[Interface\Addons\Aysons\sound\4.ogg]]) 
Aysons:Register("sound", "Aysons, 5", [[Interface\Addons\Aysons\sound\5.ogg]]) 
Aysons:Register("sound", "Aysons, 6", [[Interface\Addons\Aysons\sound\6.ogg]]) 
Aysons:Register("sound", "Aysons, 7", [[Interface\Addons\Aysons\sound\7.ogg]]) 
Aysons:Register("sound", "Aysons, 8", [[Interface\Addons\Aysons\sound\8.ogg]]) 
Aysons:Register("sound", "Aysons, 9", [[Interface\Addons\Aysons\sound\9.ogg]]) 
Aysons:Register("sound", "Aysons, Add", [[Interface\Addons\Aysons\sound\Add.ogg]]) 
Aysons:Register("sound", "Aysons, Adds", [[Interface\Addons\Aysons\sound\Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Avoid", [[Interface\Addons\Aysons\sound\Avoid.ogg]]) 
Aysons:Register("sound", "Aysons, Backup", [[Interface\Addons\Aysons\sound\Backup.ogg]]) 
Aysons:Register("sound", "Aysons, Bait", [[Interface\Addons\Aysons\sound\Bait.ogg]]) 
Aysons:Register("sound", "Aysons, Beam", [[Interface\Addons\Aysons\sound\Beam.ogg]]) 
Aysons:Register("sound", "Aysons, Behind", [[Interface\Addons\Aysons\sound\Behind.ogg]]) 
Aysons:Register("sound", "Aysons, Bloodlust", [[Interface\Addons\Aysons\sound\Bloodlust.ogg]]) 
Aysons:Register("sound", "Aysons, Blue", [[Interface\Addons\Aysons\sound\Blue.ogg]]) 
Aysons:Register("sound", "Aysons, Bomb", [[Interface\Addons\Aysons\sound\Bomb.ogg]]) 
Aysons:Register("sound", "Aysons, Boss Immune", [[Interface\Addons\Aysons\sound\Boss Immune.ogg]]) 
Aysons:Register("sound", "Aysons, Bottom", [[Interface\Addons\Aysons\sound\Bottom.ogg]]) 
Aysons:Register("sound", "Aysons, Break Tether", [[Interface\Addons\Aysons\sound\Break Tether.ogg]]) 
Aysons:Register("sound", "Aysons, Break", [[Interface\Addons\Aysons\sound\Break.ogg]]) 
Aysons:Register("sound", "Aysons, Buff", [[Interface\Addons\Aysons\sound\Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Caution", [[Interface\Addons\Aysons\sound\Caution.ogg]]) 
Aysons:Register("sound", "Aysons, CC", [[Interface\Addons\Aysons\sound\CC.ogg]]) 
Aysons:Register("sound", "Aysons, Centre", [[Interface\Addons\Aysons\sound\Centre.ogg]]) 
Aysons:Register("sound", "Aysons, Chain", [[Interface\Addons\Aysons\sound\Chain.ogg]]) 
Aysons:Register("sound", "Aysons, Circle on You", [[Interface\Addons\Aysons\sound\Circle on You.ogg]]) 
Aysons:Register("sound", "Aysons, Circle", [[Interface\Addons\Aysons\sound\Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Clear", [[Interface\Addons\Aysons\sound\Clear.ogg]]) 
Aysons:Register("sound", "Aysons, Collect", [[Interface\Addons\Aysons\sound\Collect.ogg]]) 
Aysons:Register("sound", "Aysons, Completed", [[Interface\Addons\Aysons\sound\Completed.ogg]]) 
Aysons:Register("sound", "Aysons, Crit Buff", [[Interface\Addons\Aysons\sound\Crit Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Cross on You", [[Interface\Addons\Aysons\sound\Cross on You.ogg]]) 
Aysons:Register("sound", "Aysons, Cross", [[Interface\Addons\Aysons\sound\Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Dance", [[Interface\Addons\Aysons\sound\Dance.ogg]]) 
Aysons:Register("sound", "Aysons, Debuff Avoid", [[Interface\Addons\Aysons\sound\Debuff Avoid.ogg]]) 
Aysons:Register("sound", "Aysons, Debuff", [[Interface\Addons\Aysons\sound\Debuff.ogg]]) 
Aysons:Register("sound", "Aysons, Diamond on You", [[Interface\Addons\Aysons\sound\Diamond on You.ogg]]) 
Aysons:Register("sound", "Aysons, Diamond", [[Interface\Addons\Aysons\sound\Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Dispell", [[Interface\Addons\Aysons\sound\Dispell.ogg]]) 
Aysons:Register("sound", "Aysons, Dodge", [[Interface\Addons\Aysons\sound\Dodge.ogg]]) 
Aysons:Register("sound", "Aysons, Don't Move", [[Interface\Addons\Aysons\sound\Don't Move.ogg]]) 
Aysons:Register("sound", "Aysons, Don't Release", [[Interface\Addons\Aysons\sound\Don't Release.ogg]]) 
Aysons:Register("sound", "Aysons, DPS Mind Controlled", [[Interface\Addons\Aysons\sound\DPS Mind Controlled.ogg]]) 
Aysons:Register("sound", "Aysons, DPS", [[Interface\Addons\Aysons\sound\DPS.ogg]]) 
Aysons:Register("sound", "Aysons, Drop Edges", [[Interface\Addons\Aysons\sound\Drop Edges.ogg]]) 
Aysons:Register("sound", "Aysons, Drop", [[Interface\Addons\Aysons\sound\Drop.ogg]]) 
Aysons:Register("sound", "Aysons, Edge", [[Interface\Addons\Aysons\sound\Edge.ogg]]) 
Aysons:Register("sound", "Aysons, Eggs", [[Interface\Addons\Aysons\sound\Eggs.ogg]]) 
Aysons:Register("sound", "Aysons, Escort", [[Interface\Addons\Aysons\sound\Escort.ogg]]) 
Aysons:Register("sound", "Aysons, Execute Mind Control", [[Interface\Addons\Aysons\sound\Execute Mind Control.ogg]]) 
Aysons:Register("sound", "Aysons, Execute", [[Interface\Addons\Aysons\sound\Execute.ogg]]) 
Aysons:Register("sound", "Aysons, Exit", [[Interface\Addons\Aysons\sound\Exit.ogg]]) 
Aysons:Register("sound", "Aysons, Face Away", [[Interface\Addons\Aysons\sound\Face Away.ogg]]) 
Aysons:Register("sound", "Aysons, Find Partner", [[Interface\Addons\Aysons\sound\Find Partner.ogg]]) 
Aysons:Register("sound", "Aysons, Fixate", [[Interface\Addons\Aysons\sound\Fixate.ogg]]) 
Aysons:Register("sound", "Aysons, Fixated", [[Interface\Addons\Aysons\sound\Fixated.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Add", [[Interface\Addons\Aysons\sound\Focus Add.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Adds", [[Interface\Addons\Aysons\sound\Focus Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Focus Boss", [[Interface\Addons\Aysons\sound\Focus Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal 180", [[Interface\Addons\Aysons\sound\Frontal 180.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal Cone", [[Interface\Addons\Aysons\sound\Frontal Cone.ogg]]) 
Aysons:Register("sound", "Aysons, Frontal", [[Interface\Addons\Aysons\sound\Frontal.ogg]]) 
Aysons:Register("sound", "Aysons, Gate", [[Interface\Addons\Aysons\sound\Gate.ogg]]) 
Aysons:Register("sound", "Aysons, Gather", [[Interface\Addons\Aysons\sound\Gather.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Circle", [[Interface\Addons\Aysons\sound\Go to Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Cross", [[Interface\Addons\Aysons\sound\Go to Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Diamond", [[Interface\Addons\Aysons\sound\Go to Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Moon", [[Interface\Addons\Aysons\sound\Go to Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Skull", [[Interface\Addons\Aysons\sound\Go to Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Square", [[Interface\Addons\Aysons\sound\Go to Square.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Star", [[Interface\Addons\Aysons\sound\Go to Star.ogg]]) 
Aysons:Register("sound", "Aysons, Go to Triangle", [[Interface\Addons\Aysons\sound\Go to Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Goodbye", [[Interface\Addons\Aysons\sound\Goodbye.ogg]]) 
Aysons:Register("sound", "Aysons, Green", [[Interface\Addons\Aysons\sound\Green.ogg]]) 
Aysons:Register("sound", "Aysons, Group 1", [[Interface\Addons\Aysons\sound\Group 1.ogg]]) 
Aysons:Register("sound", "Aysons, Group 2", [[Interface\Addons\Aysons\sound\Group 2.ogg]]) 
Aysons:Register("sound", "Aysons, Group 3", [[Interface\Addons\Aysons\sound\Group 3.ogg]]) 
Aysons:Register("sound", "Aysons, Group 4", [[Interface\Addons\Aysons\sound\Group 4.ogg]]) 
Aysons:Register("sound", "Aysons, Group 5", [[Interface\Addons\Aysons\sound\Group 5.ogg]]) 
Aysons:Register("sound", "Aysons, Group A", [[Interface\Addons\Aysons\sound\Group A.ogg]]) 
Aysons:Register("sound", "Aysons, Group B", [[Interface\Addons\Aysons\sound\Group B.ogg]]) 
Aysons:Register("sound", "Aysons, Group C", [[Interface\Addons\Aysons\sound\Group C.ogg]]) 
Aysons:Register("sound", "Aysons, Group D", [[Interface\Addons\Aysons\sound\Group D.ogg]]) 
Aysons:Register("sound", "Aysons, Haste Buff", [[Interface\Addons\Aysons\sound\Haste Buff.ogg]]) 
Aysons:Register("sound", "Aysons, Heal Cd", [[Interface\Addons\Aysons\sound\Heal Cd.ogg]]) 
Aysons:Register("sound", "Aysons, Healer", [[Interface\Addons\Aysons\sound\Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Healthstone", [[Interface\Addons\Aysons\sound\Healthstone.ogg]]) 
Aysons:Register("sound", "Aysons, Hero", [[Interface\Addons\Aysons\sound\Hero.ogg]]) 
Aysons:Register("sound", "Aysons, Heroism", [[Interface\Addons\Aysons\sound\Heroism.ogg]]) 
Aysons:Register("sound", "Aysons, Hide", [[Interface\Addons\Aysons\sound\Hide.ogg]]) 
Aysons:Register("sound", "Aysons, High Energy", [[Interface\Addons\Aysons\sound\High Energy.ogg]]) 
Aysons:Register("sound", "Aysons, High Stacks", [[Interface\Addons\Aysons\sound\High Stacks.ogg]]) 
Aysons:Register("sound", "Aysons, High", [[Interface\Addons\Aysons\sound\High.ogg]]) 
Aysons:Register("sound", "Aysons, Immune", [[Interface\Addons\Aysons\sound\Immune.ogg]]) 
Aysons:Register("sound", "Aysons, Immunity", [[Interface\Addons\Aysons\sound\Immunity.ogg]]) 
Aysons:Register("sound", "Aysons, In", [[Interface\Addons\Aysons\sound\In.ogg]]) 
Aysons:Register("sound", "Aysons, Inside", [[Interface\Addons\Aysons\sound\Inside.ogg]]) 
Aysons:Register("sound", "Aysons, Interrupt", [[Interface\Addons\Aysons\sound\Interrupt.ogg]]) 
Aysons:Register("sound", "Aysons, Invisibility", [[Interface\Addons\Aysons\sound\Invisibility.ogg]]) 
Aysons:Register("sound", "Aysons, Jump", [[Interface\Addons\Aysons\sound\Jump.ogg]]) 
Aysons:Register("sound", "Aysons, Kite", [[Interface\Addons\Aysons\sound\Kite.ogg]]) 
Aysons:Register("sound", "Aysons, Knock", [[Interface\Addons\Aysons\sound\Knock.ogg]]) 
Aysons:Register("sound", "Aysons, Left", [[Interface\Addons\Aysons\sound\Left.ogg]]) 
Aysons:Register("sound", "Aysons, Line of Sight", [[Interface\Addons\Aysons\sound\Line of Sight.ogg]]) 
Aysons:Register("sound", "Aysons, Linked", [[Interface\Addons\Aysons\sound\Linked.ogg]]) 
Aysons:Register("sound", "Aysons, Lock Gate", [[Interface\Addons\Aysons\sound\Lock Gate.ogg]]) 
Aysons:Register("sound", "Aysons, Lock Rock", [[Interface\Addons\Aysons\sound\Lock Rock.ogg]]) 
Aysons:Register("sound", "Aysons, Loose Stack", [[Interface\Addons\Aysons\sound\Loose Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Low Health", [[Interface\Addons\Aysons\sound\Low Health.ogg]]) 
Aysons:Register("sound", "Aysons, Low Mana", [[Interface\Addons\Aysons\sound\Low Mana.ogg]]) 
Aysons:Register("sound", "Aysons, Low Sanity", [[Interface\Addons\Aysons\sound\Low Sanity.ogg]]) 
Aysons:Register("sound", "Aysons, Low", [[Interface\Addons\Aysons\sound\Low.ogg]]) 
Aysons:Register("sound", "Aysons, Melee", [[Interface\Addons\Aysons\sound\Melee.ogg]]) 
Aysons:Register("sound", "Aysons, Mind Control", [[Interface\Addons\Aysons\sound\Mind Control.ogg]]) 
Aysons:Register("sound", "Aysons, Mines", [[Interface\Addons\Aysons\sound\Mines.ogg]]) 
Aysons:Register("sound", "Aysons, Misdirect", [[Interface\Addons\Aysons\sound\Misdirect.ogg]]) 
Aysons:Register("sound", "Aysons, Moon on You", [[Interface\Addons\Aysons\sound\Moon on You.ogg]]) 
Aysons:Register("sound", "Aysons, Moon", [[Interface\Addons\Aysons\sound\Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Move Apart", [[Interface\Addons\Aysons\sound\Move Apart.ogg]]) 
Aysons:Register("sound", "Aysons, Move as One", [[Interface\Addons\Aysons\sound\Move as One.ogg]]) 
Aysons:Register("sound", "Aysons, Move Far", [[Interface\Addons\Aysons\sound\Move Far.ogg]]) 
Aysons:Register("sound", "Aysons, Move Max Range", [[Interface\Addons\Aysons\sound\Move Max Range.ogg]]) 
Aysons:Register("sound", "Aysons, Move Out", [[Interface\Addons\Aysons\sound\Move Out.ogg]]) 
Aysons:Register("sound", "Aysons, Move Together", [[Interface\Addons\Aysons\sound\Move Together.ogg]]) 
Aysons:Register("sound", "Aysons, Move", [[Interface\Addons\Aysons\sound\Move.ogg]]) 
Aysons:Register("sound", "Aysons, Next", [[Interface\Addons\Aysons\sound\Next.ogg]]) 
Aysons:Register("sound", "Aysons, Now", [[Interface\Addons\Aysons\sound\Now.ogg]]) 
Aysons:Register("sound", "Aysons, Ocean", [[Interface\Addons\Aysons\sound\Ocean.ogg]]) 
Aysons:Register("sound", "Aysons, Orange", [[Interface\Addons\Aysons\sound\Orange.ogg]]) 
Aysons:Register("sound", "Aysons, Orb", [[Interface\Addons\Aysons\sound\Orb.ogg]]) 
Aysons:Register("sound", "Aysons, Out", [[Interface\Addons\Aysons\sound\Out.ogg]]) 
Aysons:Register("sound", "Aysons, Outside", [[Interface\Addons\Aysons\sound\Outside.ogg]]) 
Aysons:Register("sound", "Aysons, Overlap", [[Interface\Addons\Aysons\sound\Overlap.ogg]]) 
Aysons:Register("sound", "Aysons, Personal", [[Interface\Addons\Aysons\sound\Personal.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 1", [[Interface\Addons\Aysons\sound\Phase 1.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 2", [[Interface\Addons\Aysons\sound\Phase 2.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 3", [[Interface\Addons\Aysons\sound\Phase 3.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 4", [[Interface\Addons\Aysons\sound\Phase 4.ogg]]) 
Aysons:Register("sound", "Aysons, Phase 5", [[Interface\Addons\Aysons\sound\Phase 5.ogg]]) 
Aysons:Register("sound", "Aysons, Pillar", [[Interface\Addons\Aysons\sound\Pillar.ogg]]) 
Aysons:Register("sound", "Aysons, Poison", [[Interface\Addons\Aysons\sound\Poison.ogg]]) 
Aysons:Register("sound", "Aysons, Pool", [[Interface\Addons\Aysons\sound\Pool.ogg]]) 
Aysons:Register("sound", "Aysons, Pots", [[Interface\Addons\Aysons\sound\Pots.ogg]]) 
Aysons:Register("sound", "Aysons, Pre Pot", [[Interface\Addons\Aysons\sound\Pre Pot.ogg]]) 
Aysons:Register("sound", "Aysons, Puddle", [[Interface\Addons\Aysons\sound\Puddle.ogg]]) 
Aysons:Register("sound", "Aysons, Purge", [[Interface\Addons\Aysons\sound\Purge.ogg]]) 
Aysons:Register("sound", "Aysons, Purple", [[Interface\Addons\Aysons\sound\Purple.ogg]]) 
Aysons:Register("sound", "Aysons, Ranged", [[Interface\Addons\Aysons\sound\Ranged.ogg]]) 
Aysons:Register("sound", "Aysons, Ready", [[Interface\Addons\Aysons\sound\Ready.ogg]]) 
Aysons:Register("sound", "Aysons, Red", [[Interface\Addons\Aysons\sound\Red.ogg]]) 
Aysons:Register("sound", "Aysons, Reflecting Damage", [[Interface\Addons\Aysons\sound\Reflecting Damage.ogg]]) 
Aysons:Register("sound", "Aysons, Ress Healer", [[Interface\Addons\Aysons\sound\Ress Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Ress Tank", [[Interface\Addons\Aysons\sound\Ress Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Ress", [[Interface\Addons\Aysons\sound\Ress.ogg]]) 
Aysons:Register("sound", "Aysons, Right", [[Interface\Addons\Aysons\sound\Right.ogg]]) 
Aysons:Register("sound", "Aysons, Roof Beams", [[Interface\Addons\Aysons\sound\Roof Beams.ogg]]) 
Aysons:Register("sound", "Aysons, Sanity", [[Interface\Addons\Aysons\sound\Sanity.ogg]]) 
Aysons:Register("sound", "Aysons, Scatter", [[Interface\Addons\Aysons\sound\Scatter.ogg]]) 
Aysons:Register("sound", "Aysons, Self Cd", [[Interface\Addons\Aysons\sound\Self Cd.ogg]]) 
Aysons:Register("sound", "Aysons, Share Absorb", [[Interface\Addons\Aysons\sound\Share Absorb.ogg]]) 
Aysons:Register("sound", "Aysons, Share Damage", [[Interface\Addons\Aysons\sound\Share Damage.ogg]]) 
Aysons:Register("sound", "Aysons, Share Soak", [[Interface\Addons\Aysons\sound\Share Soak.ogg]]) 
Aysons:Register("sound", "Aysons, Share", [[Interface\Addons\Aysons\sound\Share.ogg]]) 
Aysons:Register("sound", "Aysons, Shroud", [[Interface\Addons\Aysons\sound\Shroud.ogg]]) 
Aysons:Register("sound", "Aysons, Side Beams", [[Interface\Addons\Aysons\sound\Side Beams.ogg]]) 
Aysons:Register("sound", "Aysons, Side", [[Interface\Addons\Aysons\sound\Side.ogg]]) 
Aysons:Register("sound", "Aysons, Skull on You", [[Interface\Addons\Aysons\sound\Skull on You.ogg]]) 
Aysons:Register("sound", "Aysons, Skull", [[Interface\Addons\Aysons\sound\Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Soak", [[Interface\Addons\Aysons\sound\Soak.ogg]]) 
Aysons:Register("sound", "Aysons, Solo", [[Interface\Addons\Aysons\sound\Solo.ogg]]) 
Aysons:Register("sound", "Aysons, Soon", [[Interface\Addons\Aysons\sound\Soon.ogg]]) 
Aysons:Register("sound", "Aysons, Spell Steal", [[Interface\Addons\Aysons\sound\Spell Steal.ogg]]) 
Aysons:Register("sound", "Aysons, Spikes", [[Interface\Addons\Aysons\sound\Spikes.ogg]]) 
Aysons:Register("sound", "Aysons, Spread", [[Interface\Addons\Aysons\sound\Spread.ogg]]) 
Aysons:Register("sound", "Aysons, Square on You", [[Interface\Addons\Aysons\sound\Square on You.ogg]]) 
Aysons:Register("sound", "Aysons, Square", [[Interface\Addons\Aysons\sound\Square.ogg]]) 
Aysons:Register("sound", "Aysons, Stack behind Boss", [[Interface\Addons\Aysons\sound\Stack behind Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Stack beside Boss", [[Interface\Addons\Aysons\sound\Stack beside Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Healer", [[Interface\Addons\Aysons\sound\Stack on Healer.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Melee", [[Interface\Addons\Aysons\sound\Stack on Melee.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Ranged", [[Interface\Addons\Aysons\sound\Stack on Ranged.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on Tank", [[Interface\Addons\Aysons\sound\Stack on Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Stack on", [[Interface\Addons\Aysons\sound\Stack on.ogg]]) 
Aysons:Register("sound", "Aysons, Stack", [[Interface\Addons\Aysons\sound\Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Stairs", [[Interface\Addons\Aysons\sound\Stairs.ogg]]) 
Aysons:Register("sound", "Aysons, Star on You", [[Interface\Addons\Aysons\sound\Star on You.ogg]]) 
Aysons:Register("sound", "Aysons, Star", [[Interface\Addons\Aysons\sound\Star.ogg]]) 
Aysons:Register("sound", "Aysons, Stop Moving", [[Interface\Addons\Aysons\sound\Stop Moving.ogg]]) 
Aysons:Register("sound", "Aysons, Stop", [[Interface\Addons\Aysons\sound\Stop.ogg]]) 
Aysons:Register("sound", "Aysons, Stopcast", [[Interface\Addons\Aysons\sound\Stopcast.ogg]]) 
Aysons:Register("sound", "Aysons, Storm", [[Interface\Addons\Aysons\sound\Storm.ogg]]) 
Aysons:Register("sound", "Aysons, Suicide", [[Interface\Addons\Aysons\sound\Suicide.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Adds", [[Interface\Addons\Aysons\sound\Switch to Adds.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Boss", [[Interface\Addons\Aysons\sound\Switch to Boss.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Circle", [[Interface\Addons\Aysons\sound\Switch to Circle.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Cross", [[Interface\Addons\Aysons\sound\Switch to Cross.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Diamond", [[Interface\Addons\Aysons\sound\Switch to Diamond.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Moon", [[Interface\Addons\Aysons\sound\Switch to Moon.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Skull", [[Interface\Addons\Aysons\sound\Switch to Skull.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Square", [[Interface\Addons\Aysons\sound\Switch to Square.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Star", [[Interface\Addons\Aysons\sound\Switch to Star.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to Triangle", [[Interface\Addons\Aysons\sound\Switch to Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Switch to", [[Interface\Addons\Aysons\sound\Switch to.ogg]]) 
Aysons:Register("sound", "Aysons, Switch", [[Interface\Addons\Aysons\sound\Switch.ogg]]) 
Aysons:Register("sound", "Aysons, Tank", [[Interface\Addons\Aysons\sound\Tank.ogg]]) 
Aysons:Register("sound", "Aysons, Targeted", [[Interface\Addons\Aysons\sound\Targeted.ogg]]) 
Aysons:Register("sound", "Aysons, Taunt", [[Interface\Addons\Aysons\sound\Taunt.ogg]]) 
Aysons:Register("sound", "Aysons, Tethered", [[Interface\Addons\Aysons\sound\Tethered.ogg]]) 
Aysons:Register("sound", "Aysons, Tight Stack", [[Interface\Addons\Aysons\sound\Tight Stack.ogg]]) 
Aysons:Register("sound", "Aysons, Top", [[Interface\Addons\Aysons\sound\Top.ogg]]) 
Aysons:Register("sound", "Aysons, Transistion", [[Interface\Addons\Aysons\sound\Transistion.ogg]]) 
Aysons:Register("sound", "Aysons, Triangle on You", [[Interface\Addons\Aysons\sound\Triangle on You.ogg]]) 
Aysons:Register("sound", "Aysons, Triangle", [[Interface\Addons\Aysons\sound\Triangle.ogg]]) 
Aysons:Register("sound", "Aysons, Turn Around", [[Interface\Addons\Aysons\sound\Turn Around.ogg]]) 
Aysons:Register("sound", "Aysons, Turn", [[Interface\Addons\Aysons\sound\Turn.ogg]]) 
Aysons:Register("sound", "Aysons, Use Cloak", [[Interface\Addons\Aysons\sound\Use Cloak.ogg]]) 
Aysons:Register("sound", "Aysons, Use", [[Interface\Addons\Aysons\sound\Use.ogg]]) 
Aysons:Register("sound", "Aysons, Void", [[Interface\Addons\Aysons\sound\Void.ogg]]) 
Aysons:Register("sound", "Aysons, Yellow", [[Interface\Addons\Aysons\sound\Yellow.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ1 ", [[Interface\Addons\Aysons\sound\ZZ1 .ogg]]) 
Aysons:Register("sound", "Aysons, ZZ10", [[Interface\Addons\Aysons\sound\ZZ10.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ2", [[Interface\Addons\Aysons\sound\ZZ2.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ3", [[Interface\Addons\Aysons\sound\ZZ3.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ4", [[Interface\Addons\Aysons\sound\ZZ4.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ5", [[Interface\Addons\Aysons\sound\ZZ5.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ6", [[Interface\Addons\Aysons\sound\ZZ6.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ7", [[Interface\Addons\Aysons\sound\ZZ7.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ8", [[Interface\Addons\Aysons\sound\ZZ8.ogg]]) 
Aysons:Register("sound", "Aysons, ZZ9", [[Interface\Addons\Aysons\sound\ZZ9.ogg]])