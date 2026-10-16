	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
        checkcode VAR_REMATCHJOHTO
        if_greater_than 0, .GymRematch
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end
.GymRematch:
        writetext CHUCKRematchText
        waitbutton
        closetext
        winlosstext CHUCKRematchLossText, 0
        checkcode VAR_REMATCHJOHTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer CHUCK, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer CHUCK, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer CHUCK, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer CHUCK, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer CHUCK, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer CHUCK, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer CHUCK, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_CHUCK
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

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

CHUCKRematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
CHUCKRematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

ChuckIntroText1:
	text "WAHAHAH!"

	para "Du hast es also"
	line "bis hierher ge-"
	cont "schafft!"

	para "Lass dir gesagt"
	line "sein, dass ich ein"
	cont "harter Brocken"
	cont "bin."

	para "Meine #MON"
	line "werden dich in"
	cont "Grund und Boden"
	cont "rammen!"

	para "Pass auf!"
	done

ChuckIntroText2:
	text "HARTWIG: Urggh!"
	line "…"

	para "Oooarrgh!"
	done

ChuckIntroText3:
	text "Da! Jetzt hast du"
	line "dich erschreckt!"

	para "Wie?"
	line "Es hat nichts mit"

	para "#MON zu tun?"
	line "Das ist wahr!"

	para "Komm her. Lass uns"
	line "kämpfen!"
	done

ChuckLossText:
	text "Wa…? Huch?"
	line "Ich habe verloren?"

	para "Wie wär's damit?"
	line "Du bist des FAUST-"
	cont "ORDENs würdig!"
	done

GetStormBadgeText:
	text "<PLAYER> erhält"
	line "FAUSTORDEN."
	done

ChuckExplainBadgeText:
	text "Durch den FAUSTOR-"
	line "DEN gehorchen dir"

	para "alle #MON"
	line "bis LV 70. Dies"

	para "gilt auch für Ge-"
	line "tauschte."

	para "Außerdem können"
	line "deine #MON"

	para "FLIEGEN auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Hier, nimm auch"
	line "dies!"
	done

ChuckExplainTMText:
	text "Das ist WUCHT-"
	line "SCHLAG."

	para "Er trifft zwar"
	line "nicht immer, aber"

	para "wenn er es tut,"
	line "verwirrt er den"
	cont "Gegner!"
	done

ChuckAfterText:
	text "WAHAHAH! Es hat"
	line "Spaß gemacht, ge-"
	cont "gen dich zu kämp-"
	cont "fen."

	para "Aber eine Nieder-"
	line "lage bleibt eine"
	cont "Niederlage!"

	para "Von jetzt an werde"
	line "ich 24 Stunden am"
	cont "Tag trainieren!"
	done

BlackbeltYoshiSeenText:
	text "Meine #MON und"
	line "mich verbindet un-"
	cont "sere Freundschaft."

	para "Dieses Band wird"
	line "nie zerreißen!"
	done

BlackbeltYoshiBeatenText:
	text "Das ist unmöglich!"
	done

BlackbeltYoshiAfterText:
	text "Es scheint, als"
	line "stündest auch du"
	cont "deinen #MON"
	cont "sehr nahe!"
	done

BlackbeltLaoSeenText:
	text "Wir Meister der"
	line "Kampfkunst haben"
	cont "vor nichts Angst!"
	done

BlackbeltLaoBeatenText:
	text "Schockierend!"
	done

BlackbeltLaoAfterText:
	text "Kampf-#MON"
	line "fürchten sich vor"
	cont "Psycho-Attacken…"
	done

BlackbeltNobSeenText:
	text "Worte sind nutz-"
	line "los. Lass deine"
	cont "Fäuste sprechen!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ich habe verloren!"
	line "Ich bin sprachlos!"
	done

BlackbeltLungSeenText:
	text "Gegen die Wut mei-"
	line "ner Fäuste können"
	cont "deine #MON"
	cont "nichts ausrichten!"
	done

BlackbeltLungBeatenText:
	text "Ich wurde zer-"
	line "schmettert!"
	done

BlackbeltLungAfterText:
	text "Meine #MON ha-"
	line "ben verloren…"
	cont "Mein Stolz ist"
	cont "zerstört…"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
