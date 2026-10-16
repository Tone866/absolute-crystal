	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
        checkcode VAR_REMATCHJOHTO
        if_greater_than 0, .VioletGymRematch
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
.VioletGymRematch:
        writetext FalknerRematchText
        waitbutton
        closetext
	winlosstext FalknerRematchLossText, 0
        checkcode VAR_REMATCHJOHTO
        ifequal 1, .VioletGymRematchOne
        ifequal 2, .VioletGymRematchTwo
        ifequal 3, .VioletGymRematchThree
        ifequal 4, .VioletGymRematchFour
        ifequal 5, .VioletGymRematchFive
        ifequal 6, .VioletGymRematchSix
        ifequal 7, .VioletGymRematchSeven
.VioletGymRematchOne:
        loadtrainer FALKNER, 2
        sjump .FinishedLoadingTrainer
.VioletGymRematchTwo:
        loadtrainer FALKNER, 3
        sjump .FinishedLoadingTrainer
.VioletGymRematchThree:
        loadtrainer FALKNER, 4
        sjump .FinishedLoadingTrainer
.VioletGymRematchFour:
        loadtrainer FALKNER, 5
        sjump .FinishedLoadingTrainer
.VioletGymRematchFive:
        loadtrainer FALKNER, 6
        sjump .FinishedLoadingTrainer
.VioletGymRematchSix:
        loadtrainer FALKNER, 7
        sjump .FinishedLoadingTrainer
.VioletGymRematchSeven:
        loadtrainer FALKNER, 8
	sjump .FinishedLoadingTrainer
.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_FALKNER
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

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymLevelScript:
        faceplayer
        opentext
        checkcode VAR_REMATCHJOHTO
        checkcode VAR_BADGES
        if_greater_than 7, .VioletGymLevelWinScript
        writetext VioletGymLevelNoBadgesText
        waitbutton
        closetext
        end

.VioletGymLevelWinScript:
        readvar VAR_REMATCHJOHTO
        writetext VioletGymLevelWinText
        waitbutton

	checkcode VAR_REMATCHJOHTOMAX
	ifequal 0, .max1
        ifequal 1, .max2
        ifequal 2, .max3
        ifequal 3, .max4
        ifequal 4, .max5
        ifequal 5, .max6
        ifequal 6, .max7

.max1:
	loadmenu VioletGymSelectLevel
	sjump .MenuEnd
.max2:
        loadmenu VioletGymSelectLevel2
        sjump .MenuEnd
.max3:
        loadmenu VioletGymSelectLevel3
        sjump .MenuEnd
.max4:
        loadmenu VioletGymSelectLevel4
        sjump .MenuEnd
.max5:
        loadmenu VioletGymSelectLevel5
        sjump .MenuEnd
.max6:
        loadmenu VioletGymSelectLevel6
        sjump .MenuEnd
.max7:
        loadmenu VioletGymSelectLevel7
        sjump .MenuEnd

.MenuEnd:
        verticalmenu
        closewindow
        ifequal 2, .VioletGymLevelOne
        ifequal 3, .VioletGymLevelTwo
        ifequal 4, .VioletGymLevelThree
        ifequal 5, .VioletGymLevelFour
        ifequal 6, .VioletGymLevelFive
        ifequal 7, .VioletGymLevelSix
        ifequal 8, .VioletGymLevelSeven
        ifequal 1, .VioletGymLevelBack
        end

.VioletGymLevelOne:
        readvar VAR_REMATCHJOHTO
        setval 1
        writevar VAR_REMATCHJOHTO
	sjump .VioletGymResetGyms
        end

.VioletGymLevelTwo:
        readvar VAR_REMATCHJOHTO
        setval 2
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelThree:
        readvar VAR_REMATCHJOHTO
        setval 3
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelFour:
        readvar VAR_REMATCHJOHTO
        setval 4
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelFive:
        readvar VAR_REMATCHJOHTO
        setval 5
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelSix:
        readvar VAR_REMATCHJOHTO
        setval 6
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelSeven:
        readvar VAR_REMATCHJOHTO
        setval 7
        writevar VAR_REMATCHJOHTO
        sjump .VioletGymResetGyms
        end

.VioletGymLevelBack:
        writetext .AbortText
        waitbutton
        closetext
        end

.VioletGymResetGyms:
;        clearevent EVENT_BEAT_BIRD_KEEPER_ROD
;        clearevent EVENT_BEAT_BIRD_KEEPER_ABE
        clearevent EVENT_BEAT_FALKNER
        clearevent EVENT_BEAT_BUGSY
        clearevent EVENT_BEAT_WHITNEY
        clearevent EVENT_BEAT_MORTY
        clearevent EVENT_BEAT_CHUCK
        clearevent EVENT_BEAT_JASMINE
        clearevent EVENT_BEAT_PRYCE
        clearevent EVENT_BEAT_CLAIR

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
        text_decimal wRematchJohto, 1, 1
        text "!"
        done

.YouChoseText:
	text "Du hast gewählt:"
	line "Lvl @"
;	text_decimal wScriptVar, 1, 1
        text_decimal wRematchJohto, 1, 1
	text "!"

	para "Gegner werden"
	line "zurückgesetzt."
	done

VioletGymSelectLevel:
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

VioletGymSelectLevel2:
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

VioletGymSelectLevel3:
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

VioletGymSelectLevel4:
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

VioletGymSelectLevel5:
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

VioletGymSelectLevel6:
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

VioletGymSelectLevel7:
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

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerRematchText:
	text "Eine Revanche?"
	line "Alles klar,"

	para "aber ich bin"
	line "stärker geworden!"
	done
FalknerRematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done
FalknerIntroText:
	text "Ich bin FALK, der"
	line "ARENALEITER von"
	cont "VIOLA CITY!"

	para "Man sagt, dass man"
	line "die Flügel von"

	para "Flug-#MON mit"
	line "einem elektrischen"

	para "Blitz stutzen"
	line "kann…"

	para "So etwas werde ich"
	line "niemals zulassen!"

	para "Ich werde dich die"
	line "wahre Kraft der"

	para "Flug-#MON"
	line "spüren lassen!"
	done

FalknerWinLossText:
	text "…Verflixt! Mein"
	line "Vater hat Flug-"
	cont "#MON geliebt…"

	para "Also gut."
	line "Nimm dies!"

	para "Es ist der offi-"
	line "zielle FLÜGELORDEN"
	cont "der #MON"
	cont "LIGA."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> erhält den"
	line "FLÜGELORDEN."
	done

FalknerZephyrBadgeText:
	text "Der FLÜGELORDEN"
	line "stärkt den ANGR-"
	cont "Wert deiner #-"
	cont "MON."

	para "Außerdem können"
	line "deine #MON"

	para "jederzeit BLITZ"
	line "einsetzen."

	para "Hier - ich habe"
	line "noch etwas für"
	cont "dich."
	done

FalknerTMMudSlapText:
	text "Benutzt ein #-"
	line "MON eine TM, er-"
	cont "lernt es sofort"
	cont "eine neue Attacke."

	para "Überlege dir den"
	line "Einsatz gut - eine"
	cont "TM kann nur einmal"
	cont "eingesetzt werden."

	para "TM31 enthält"
	line "LEHMSCHELLE."

	para "Sie fügt dem Geg-"
	line "ner Schaden zu und"

	para "reduziert gleich-"
	line "zeitig seine Ge-"
	cont "nauigkeit."

	para "Mit anderen Wor-"
	line "ten: Sie ist"
	cont "sowohl defensiv"
	cont "als auch offensiv."
	done

FalknerFightDoneText:
	text "In so mancher"
	line "Stadt warten noch"
	cont "ARENEN auf dich."

	para "Du solltest dein"
	line "Können in diesen"
	cont "ARENEN beweisen."

	para "Ich werde noch"
	line "härter trainieren,"

	para "um der größte Vo-"
	line "gel-Experte aller"
	cont "Zeiten zu werden!"
	done

BirdKeeperRodSeenText:
	text "Das Motto lautet:"
	line "Courage!"

	para "Sie alle hier üben"
	line "Tag und Nacht,"

	para "um Vogel-Meister-"
	line "Trainer zu werden."

	para "Komm schon!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKs Fähigkeiten"
	line "sind unübertreff-"
	cont "lich!"

	para "Du solltest dich"
	line "nicht überschät-"
	cont "zen, nur weil du"
	cont "mich geschlagen"
	cont "hast!"
	done

BirdKeeperAbeSeenText:
	text "Lass mich heraus-"
	line "finden, ob du gut"
	cont "genug bist, um ge-"
	cont "gen FALK anzutre-"
	cont "ten!"
	done

BirdKeeperAbeBeatenText:
	text "Das kann nicht"
	line "wahr sein!"
	done

BirdKeeperAbeAfterBattleText:
	text "Das ist peinlich!"
	line "Von einem Anfänger"
	cont "besiegt…"
	done

VioletGymGuideText:
	text "Hey! Zwar bin ich"
	line "kein Trainer, aber"
	cont "ich kann dir gute"
	cont "Tipps geben!"

	para "Glaube mir!"
	line "Wenn du es tust,"

	para "kann dein Traum"
	line "von der Meister-"
	cont "schaft in Erfül-"
	cont "lung gehen."

	para "Du glaubst mir?"
	line "Dann pass auf!"

	para "Typ Pflanze ist"
	line "schwach gegen Typ"

	para "Flug. Das solltest"
	line "du dir merken."
	done

VioletGymGuideWinText:
	text "Netter Kampf! Mach"
	line "weiter so und bald"

	para "schon wirst du der"
	line "CHAMP sein!"
	done

VioletGymLevelWinText:
        text "Möchtest du dein"
	line "Rematch-LVL"

	para "ändern oder"
	line "zurücksetzen?"

	para "Aktuelles Lvl"
        line "ist: @"
        text_decimal wRematchJohto, 1, 1
        text "!"
        done

VioletGymLevelNoBadgesText:
        text "Ich bin der"
	line "REMATCH VERMITTLER"

	para "Wenn du genug"
	line "Ordnen hast,"

	para "kannst du die"
	line "Arenen zu einem"

	para "Rematch heraus-"
	line "fordern."
        done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
        object_event  2, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymLevelScript, -1
