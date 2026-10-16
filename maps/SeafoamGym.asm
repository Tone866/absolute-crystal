	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
        checkcode VAR_REMATCHKANTO
        if_greater_than 0, .GymRematch
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end
.GymRematch:
        writetext BLAINERematchText
        waitbutton
        closetext
        winlosstext BLAINERematchLossText, 0
        checkcode VAR_REMATCHKANTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer BLAINE, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer BLAINE, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer BLAINE, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer BLAINE, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer BLAINE, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer BLAINE, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer BLAINE, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_BLAINE
        playsound SFX_GET_BADGE
        waitsfx
        checkevent EVENT_BEAT_BROCK
        iffalse .End
        checkevent EVENT_BEAT_MISTY
        iffalse .End
        checkevent EVENT_BEAT_LTSURGE
        iffalse .End
        checkevent EVENT_BEAT_ERIKA
        iffalse .End
        checkevent EVENT_BEAT_JANINE
        iffalse .End
        checkevent EVENT_BEAT_SABRINA
        iffalse .End
        checkevent EVENT_BEAT_BLAINE
        iffalse .End
        checkevent EVENT_BEAT_BLUE
        iffalse .End

        checkcode VAR_REMATCHKANTO
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
        readvar VAR_REMATCHKANTOMAX
        addval 1
        writevar VAR_REMATCHKANTOMAX
        waitsfx
        playsound SFX_TRANSACTION
        waitsfx
        end

.Check1:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 1, .Win
        end
.Check2:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 2, .Win
        end
.Check3:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 3, .Win
        end
.Check4:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 4, .Win
        end
.Check5:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 5, .Win
        end
.Check6:
        readvar VAR_REMATCHKANTOMAX
        if_less_than 6, .Win
        end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BLAINERematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
BLAINERematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

BlaineIntroText:
	text "PYRO: Wuah!"

	para "Meine PKMN-ARENA"
	line "auf der ZINNOBER-"
	cont "INSEL ist abge-"
	cont "brannt. Meine"

	para "Feuer-#MON und"
	line "ich sind wegen des"

	para "Vulkanausbruchs"
	line "obdachlos."

	para "Buah!"

	para "Aber ich führe"
	line "meine Tätigkeit"

	para "als ARENALEITER in"
	line "dieser Höhle"
	cont "weiter aus."

	para "Wenn du mich"
	line "besiegst, bekommst"
	cont "du einen ORDEN."

	para "Es wäre besser,"
	line "du hast"
	cont "FEUERHEILER!"
	done

BlaineWinLossText:
	text "PYRO: Gut gemacht."
	line "Ich bin"
	cont "ausgebrannt…"

	para "Hier nimm den"
	line "VULKANORDEN!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> erhält"
	line "VULKANORDEN."
	done

BlaineAfterBattleText:
	text "PYRO: Diesmal habe"
	line "ich verloren, aber"

	para "beim nächsten Mal"
	line "werde ich"
	cont "gewinnen."

	para "Ich werde meine"
	line "PKMN-ARENA auf der"

	para "ZINNOBERINSEL"
	line "wieder aufbauen"
	cont "und dann wirst du"
	cont "erneut gegen mich"
	cont "antreten."
	done

BlaineFightDoneText:
	text "PYRO: Meine Feuer-"
	line "#MON werden"

	para "noch stärker sein."
	line "Du wirst schon"
	cont "sehen!"
	done

SeafoamGymGuideWinText:
	text "Jawohl!"

	para "…Huh? Es ist"
	line "schon vorüber?"

	para "Sorry, Kumpel!"

	para "Die PKMN-ARENA auf"
	line "der ZINNOBERINSEL"

	para "existiert nicht"
	line "mehr und ich"
	cont "wusste nicht, wo"
	cont "du steckst."

	para "Aber egal! Du"
	line "bist auch ohne"

	para "meinen Ratschlag"
	line "zurechtgekommen."
	cont "Ich wusste, du"
	cont "würdest gewinnen."
	done

SeafoamGymGuideWinText2:
	text "Eine PKMN-ARENA"
	line "kann überall sein,"

	para "solange der ARENA-"
	line "LEITER dort ist."

	para "Man braucht dafür"
	line "kein Gebäude."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
