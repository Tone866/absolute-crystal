const_value set 2
	const LEGENDARY_MEWTWO
	
CeruleanCave_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_OBJECTS, .Mewtwo
	
.Mewtwo:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	checkevent EVENT_BEAT_RED
	iftrue .Appear
.NoAppear
	disappear LEGENDARY_MEWTWO
	return

.Appear:
	appear LEGENDARY_MEWTWO
	return

Mewtwo:
	opentext
	writetext MewtwoText
	cry Mewtwo
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadwildmon MEWTWO, 50
	startbattle
	disappear LEGENDARY_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "Gyaoo!"
	done

CeruleanCave_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 37, 21, 7, CERULEAN_CITY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 19, 19, SIGNPOST_ITEM, CeruleanCityHiddenBerserkGene

.ObjectEvents: db 1
	person_event SPRITE_CHARMANDER, 19, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Mewtwo, EVENT_LEGENDARY_MEWTWO
