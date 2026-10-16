	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
        checkcode VAR_REMATCHKANTO
        if_greater_than 0, .GymRematch
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end
.GymRematch:
        writetext BROCKRematchText
        waitbutton
        closetext
        winlosstext BROCKRematchLossText, 0
        checkcode VAR_REMATCHKANTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer BROCK, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer BROCK, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer BROCK, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer BROCK, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer BROCK, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer BROCK, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer BROCK, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_BROCK
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

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

PewterGymLevelScript:
        faceplayer
        opentext
        checkcode VAR_REMATCHKANTO
        checkcode VAR_BADGES
        if_greater_than 15, .PewterGymLevelWinScript
        writetext PewterGymLevelNoBadgesText
        waitbutton
        closetext
        end

.PewterGymLevelWinScript:
        readvar VAR_REMATCHKANTO
        writetext PewterGymLevelWinText
        waitbutton

        checkcode VAR_REMATCHKANTOMAX
        ifequal 0, .max1
        ifequal 1, .max2
        ifequal 2, .max3
        ifequal 3, .max4
        ifequal 4, .max5
        ifequal 5, .max6
        ifequal 6, .max7

.max1:
        loadmenu PewterGymSelectLevel
        sjump .MenuEnd
.max2:
        loadmenu PewterGymSelectLevel2
        sjump .MenuEnd
.max3:
        loadmenu PewterGymSelectLevel3
        sjump .MenuEnd
.max4:
        loadmenu PewterGymSelectLevel4
        sjump .MenuEnd
.max5:
        loadmenu PewterGymSelectLevel5
        sjump .MenuEnd
.max6:
        loadmenu PewterGymSelectLevel6
        sjump .MenuEnd
.max7:
        loadmenu PewterGymSelectLevel7
        sjump .MenuEnd

.MenuEnd:
        verticalmenu
        closewindow
        ifequal 2, .PewterGymLevelOne
        ifequal 3, .PewterGymLevelTwo
        ifequal 4, .PewterGymLevelThree
        ifequal 5, .PewterGymLevelFour
        ifequal 6, .PewterGymLevelFive
        ifequal 7, .PewterGymLevelSix
        ifequal 8, .PewterGymLevelSeven
        ifequal 1, .PewterGymLevelBack
        end

.PewterGymLevelOne:
        readvar VAR_REMATCHKANTO
        setval 1
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelTwo:
        readvar VAR_REMATCHKANTO
        setval 2
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelThree:
        readvar VAR_REMATCHKANTO
        setval 3
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelFour:
        readvar VAR_REMATCHKANTO
        setval 4
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelFive:
        readvar VAR_REMATCHKANTO
        setval 5
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelSix:
        readvar VAR_REMATCHKANTO
        setval 6
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelSeven:
        readvar VAR_REMATCHKANTO
        setval 7
        writevar VAR_REMATCHKANTO
        sjump .PewterGymResetGyms
        end

.PewterGymLevelBack:
        writetext .AbortText
        waitbutton
        closetext
        end

.PewterGymResetGyms:
;        clearevent EVENT_BEAT_BIRD_KEEPER_ROD
;        clearevent EVENT_BEAT_BIRD_KEEPER_ABE
        clearevent EVENT_BEAT_BROCK
        clearevent EVENT_BEAT_MISTY
        clearevent EVENT_BEAT_LTSURGE
        clearevent EVENT_BEAT_ERIKA
        clearevent EVENT_BEAT_JANINE
        clearevent EVENT_BEAT_SABRINA
        clearevent EVENT_BEAT_BLAINE
        clearevent EVENT_BEAT_BLUE

        waitsfx
        playsound SFX_TRANSACTION
        waitsfx
        writetext .YouChoseText
        waitbutton
        closetext
        end

.AbortText:
        text "Ok es bleibt bei:"
        line "Lvl @"
;       text_decimal wScriptVar, 1, 1
        text_decimal wRematchKanto, 1, 1
        text "!"
        done

.YouChoseText:
        text "Du hast gewählt:"
        line "Lvl @"
;       text_decimal wScriptVar, 1, 1
        text_decimal wRematchKanto, 1, 1
        text "!"

        para "Gegner werden"
        line "zurückgesetzt."
        done

PewterGymSelectLevel:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData
        db 1 ; default option
        end

.MenuData:
        db STATICMENU_CURSOR ; flags
        db 2 ; items
        db "Zurück@"
        db "1@"
        end

PewterGymSelectLevel2:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData2
        db 1 ; default option
        end

.MenuData2:
        db STATICMENU_CURSOR ; flags
        db 3 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        end

PewterGymSelectLevel3:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData3
        db 1 ; default option
        end

.MenuData3:
        db STATICMENU_CURSOR ; flags
        db 4 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        db "3@"
        end

PewterGymSelectLevel4:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData4
        db 1 ; default option
        end

.MenuData4:
        db STATICMENU_CURSOR ; flags
        db 5 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        end

PewterGymSelectLevel5:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData5
        db 1 ; default option
        end

.MenuData5:
        db STATICMENU_CURSOR ; flags
        db 6 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        db "5@"
        end

PewterGymSelectLevel6:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData6
        db 1 ; default option
        end

.MenuData6:
        db STATICMENU_CURSOR ; flags
        db 7 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        db "5@"
        db "6@"
        end

PewterGymSelectLevel7:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData7
        db 1 ; default option
        end

.MenuData7:
        db STATICMENU_CURSOR ; flags
        db 8 ; items
        db "Zurück@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        db "5@"
        db "6@"
        db "7@"
        end

BROCKRematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
BROCKRematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

BrockIntroText:
	text "ROCKO: Wow, es"
	line "kommt nicht oft"

	para "vor, dass wir von"
	line "einem Heraus-"
	cont "forderer aus JOHTO"
	cont "besucht werden."

	para "Ich bin ROCKO, der"
	line "ARENALEITER von"

	para "MARMORIA. Ich habe"
	line "mich auf Gestein-"
	cont "#MON"
	cont "spezialisiert."

	para "Meine #MON sind"
	line "gegen die meisten"

	para "physischen Atta-"
	line "cken immun. Es"
	cont "wird dir schwer"

	para "fallen, ihnen"
	line "Schaden zuzufügen."
	cont "Na los!"
	done

BrockWinLossText:
	text "ROCKO: Die mäch-"
	line "tigen Attacken"
	cont "deiner #MON"
	cont "haben meine"
	cont "felsenfeste"
	cont "Verteidigung"
	cont "überwunden…"

	para "Du bist stärker,"
	line "als ich dachte…"

	para "Komm - Nimm dir"
	line "diesen ORDEN."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> erhält"
	line "FELSORDEN."
	done

BrockBoulderBadgeText:
	text "ROCKO: Danke,"
	line "<PLAY_G>. Es war"

	para "eine Freude, gegen"
	line "dich zu kämpfen."

	para "Auch wenn ich ein"
	line "bisschen beleidigt"
	cont "bin."

	para "Dieser FELSORDEN"
	line "wird deine #-"
	cont "MON noch stärker"
	cont "machen."
	done

BrockFightDoneText:
	text "ROCKO: Die Welt"
	line "ist groß. Es gibt"

	para "immer noch viele"
	line "starke Trainer wie"
	cont "dich."

	para "Warte nur ab. Ich"
	line "werde auch noch"
	cont "viel stärker."
	done

CamperJerrySeenText:
	text "Die Trainer dieser"
	line "PKMN-ARENA setzen"
	cont "Gestein-#MON"
	cont "ein."

	para "Gestein-#MON"
	line "haben hohe"
	cont "VERT-Werte."

	para "Die Kämpfe können"
	line "sehr lange"

	para "dauern. Bist du"
	line "bereit dafür?"
	done

CamperJerryBeatenText:
	text "Ich muss diese"
	line "Kämpfe gewinnen…"
	done

CamperJerryAfterBattleText:
	text "He, du da! Trainer"
	line "aus JOHTO! ROCKO"

	para "ist stark. Es wird"
	line "dir übel bekommen,"

	para "wenn du ihn nicht"
	line "ernst nimmst."
	done

PewterGymGuideText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Das ist cool!"
	line "Kämpfst du gegen"

	para "die ARENALEITER in"
	line "KANTO?"

	para "Sie sind stark und"
	line "ambitioniert, wie"

	para "die ARENALEITER in"
	line "JOHTO."
	done

PewterGymGuideWinText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Diese PKMN-ARENA"
	line "stellte kein"

	para "Problem für dich"
	line "dar."

	para "Dein Einsatz"
	line "ist wirklich"

	para "beeindruckend. Das"
	line "meine ich ehrlich."
	done

PewterGymLevelWinText:
        text "Möchtest du dein"
        line "Rematch-LVL"

        para "ändern oder"
        line "zurücksetzen?"

        para "Aktuelles Lvl"
        line "ist: @"
        text_decimal wRematchJohto, 1, 1
        text "!"
        done

PewterGymLevelNoBadgesText:
        text "Ich bin der"
        line "REMATCH VERMITTLER"

        para "Wenn du genug"
        line "Ordnen hast,"

        para "kannst du die"
        line "Arenen zu einem"

        para "Rematch heraus-"
        line "fordern."
        done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
        object_event  3, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterGymLevelScript, -1
