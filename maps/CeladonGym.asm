	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
        checkcode VAR_REMATCHKANTO
        if_greater_than 0, .GymRematch
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end
.GymRematch:
        writetext ERIKARematchText
        waitbutton
        closetext
        winlosstext ERIKARematchLossText, 0
        checkcode VAR_REMATCHKANTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer ERIKA, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer ERIKA, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer ERIKA, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer ERIKA, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer ERIKA, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer ERIKA, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer ERIKA, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_ERIKA
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

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ERIKARematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
ERIKARematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

ErikaBeforeBattleText:
	text "ERIKA: Hallo…"
	line "Schönes Wetter,"

	para "nicht?"
	line "Einfach herrlich…"

	para "…Ich könnte gleich"
	line "einschlafen…"

	para "Ich heiße ERIKA."
	line "Ich bin die ARENA-"
	cont "LEITERIN von"
	cont "PRISMANIA CITY."

	para "…Wirklich? Den"
	line "ganzen Weg von "
	cont "JOHTO? Wie nett…"

	para "Oh, entschuldige."
	line "Ich wusste"

	para "nicht, dass du"
	line "gegen mich kämpfen"
	cont "willst."

	para "Nun gut. Ich werde"
	line "jedenfalls nicht"
	cont "verlieren."
	done

ErikaBeatenText:
	text "ERIKA: Oh!"
	line "Ich gebe mich"
	cont "geschlagen…"

	para "Du bist außerge-"
	line "wöhnlich stark…"

	para "Ich gebe dir den"
	line "FARBORDEN…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> erhält"
	line "FARBORDEN."
	done

ErikaExplainTMText:
	text "ERIKA: Das war ein"
	line "herrlicher Kampf."

	para "Das spornt zu"
	line "neuen Taten an."

	para "Nimm bitte diese"
	line "TM an."

	para "Es ist GIGASAUGER."

	para "Das ist eine"
	line "schöne Attacke."

	para "Die Hälfte des zu-"
	line "gefügten Schadens"
	cont "wird zur Heilung"

	para "deines #MON"
	line "verwendet."

	para "Verwende sie,"
	line "wann immer du"
	cont "möchtest…"
	done

ErikaAfterBattleText:
	text "ERIKA: Eine"
	line "Niederlage ist"

	para "nicht sehr"
	line "angenehm…"

	para "Aber es ist ein"
	line "Ansporn, sich"

	para "mehr anzustrengen,"
	line "wenn man weiß,"

	para "dass es starke"
	line "Trainer gibt…"
	done

LassMichelleSeenText:
	text "Glaubst du, dass"
	line "eine PKMN-ARENA"
	cont "nur mit Mädchen"
	cont "selten ist?"
	done

LassMichelleBeatenText:
	text "Ach nee!"
	done

LassMichelleAfterBattleText:
	text "Ich wurde nur"
	line "unvorsichtig, das"
	cont "ist alles!"
	done

PicnickerTanyaSeenText:
	text "Oh, ein Kampf?"
	line "Das macht mir ein"
	cont "bisschen Angst,"
	cont "aber von mir aus!"
	done

PicnickerTanyaBeatenText:
	text "Ach, das war es?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, sieh nur, all"
	line "die ORDEN. Kein"

	para "Wunder, dass ich"
	line "verloren habe!"
	done

BeautyJuliaSeenText:
	text "Hast du die"
	line "Blumen betrachtet"
	cont "oder mich?"
	done

BeautyJuliaBeatenText:
	text "Wie ärgerlich!"
	done

BeautyJuliaAfterBattleText:
	text "Wie werde ich nur"
	line "so damenhaft"
	cont "wie ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "Wir zeigen dir"
	line "#MON-Attacken,"
	cont "die ERIKA uns"
	cont "beigebracht hat!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… Wir haben"
	line "verloren…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "ERIKA wird es dir"
	line "heimzahlen!"
	done

TwinsJoAndZoe2SeenText:
	text "Wir werden ERIKA"
	line "beschützen!"
	done

TwinsJoAndZoe2BeatenText:
	text "Wir hatten keine"
	line "Chance…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA ist viel"
	line "stärker!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
