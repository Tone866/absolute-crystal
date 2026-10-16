	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
        checkflag ENGINE_STORMBADGE
	iffalse .nobadge
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
        checkcode VAR_REMATCHJOHTO
        if_greater_than 0, .GymRematch
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end
.nobadge:
	writetext JasmineNobadge
	waitbutton
	closetext
	end

.GymRematch:
        writetext JASMINERematchText
        waitbutton
        closetext
        winlosstext JASMINERematchLossText, 0
        checkcode VAR_REMATCHJOHTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer JASMINE, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer JASMINE, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer JASMINE, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer JASMINE, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer JASMINE, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer JASMINE, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer JASMINE, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_JASMINE
        playsound SFX_GET_BADGE
        waitsfx
        checkevent EVENT_BEAT_FALKNER
        iffalse .End
        checkevent EVENT_BEAT_BUGSY
        iffalse .End
        checkevent EVENT_BEAT_WHITNEY
        iffalse .End
        checkevent EVENT_BEAT_MORTY
        iffalse .End
        checkevent EVENT_BEAT_CHUCK
        iffalse .End
        checkevent EVENT_BEAT_JASMINE
        iffalse .End
        checkevent EVENT_BEAT_PRYCE
        iffalse .End
        checkevent EVENT_BEAT_CLAIR
        iffalse .End

        checkcode VAR_REMATCHJOHTO
        if_equal 1, .Check1
        if_equal 2, .Check2
        if_equal 3, .Check3
        if_equal 4, .Check4
        if_equal 5, .Check5
        if_equal 6, .Check6
        end
.End:
        end
.Win:
        readvar VAR_REMATCHJOHTOMAX
        addval 1
        writevar VAR_REMATCHJOHTOMAX
        waitsfx
        playsound SFX_TRANSACTION
        waitsfx
        end

.Check1:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 1, .Win
        end
.Check2:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 2, .Win
        end
.Check3:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 3, .Win
        end
.Check4:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 4, .Win
        end
.Check5:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 5, .Win
        end
.Check6:
        readvar VAR_REMATCHJOHTOMAX
        if_less_than 6, .Win
        end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

JasmineNobadge:
	text "Du brauchst min."
	line "5 Orden um mich"

	para "herausfordern zu"
	line "können. Komm"

	para "später wieder,"
	line "ich werde hier"

	para "auf dich warten."
	done

JASMINERematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
JASMINERematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

Jasmine_SteelTypeIntro:
	text "…Danke für deine"
	line "Hilfe beim LEUCHT-"
	cont "TURM…"

	para "Erlaube mir, mich"
	line "vorstellen zu dür-"
	cont "fen!"

	para "Ich bin JASMIN,"
	line "eine ARENALEITE-"
	cont "RIN. Ich setze"
	cont "STAHL-#MON ein."

	para "…Hast du von die-"
	line "sem Typ schon ge-"
	cont "hört?"

	para "Er wurde erst vor"
	line "kurzer Zeit ent-"
	cont "deckt."

	para "…Ähm… Darf ich be-"
	line "ginnen?"
	done

Jasmine_BetterTrainer:
	text "…Du bist ein bes-"
	line "serer Trainer als"

	para "ich. Das betrifft"
	line "sowohl Geschick,"

	para "als auch Fein-"
	line "gefühl."

	para "In Übereinstimmung"
	line "mit den Regeln der"

	para "LIGA überreiche"
	line "ich dir diesen"
	cont "ORDEN."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> erhält"
	line "STAHLORDEN."
	done

Jasmine_BadgeSpeech:
	text "Der STAHLORDEN"
	line "erhöht die VERT"
	cont "deiner #MON."

	para "…Ähm… Bitte nimm"
	line "auch das…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> erhält"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "…Mit dieser TM"
	line "kannst du deinen"
	cont "#MON EISEN-"
	cont "SCHWEIF lehren."
	done

Jasmine_GoodLuck:
	text "Ähm… Ich weiß"
	line "nicht, wie ich das"
	cont "sagen soll, aber…"
	cont "Viel Glück!"
	done

OlivineGymGuideText:
	text "JASMIN setzt den"
	line "neu entdeckten Typ"
	cont "Stahl ein."

	para "Ich weiß nicht"
	line "viel darüber."
	done

OlivineGymGuideWinText:
	text "Das war großartig!"

	para "Der Typ Stahl,"
	line "was?"

	para "Das war eine un-"
	line "heimliche Begeg-"
	cont "nung der unbe-"
	cont "kannten Art."
	done

OlivineGymGuidePreText:
	text "JASMIN, die ARE-"
	line "NALEITERIN, ist im"
	cont "LEUCHTTURM."

	para "Sie kümmert sich"
	line "um ein krankes"
	cont "#MON."

	para "Ein starker Trai-"
	line "ner muss auch Mit-"
	cont "gefühl zeigen."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
