	object_const_def
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_RIVAL
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA

IndigoPlateauPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script IndigoPlateauPokecenter1FNoopScene, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, IndigoPlateauPokecenter1FPrepareElite4Callback

IndigoPlateauPokecenter1FNoopScene:
	end

IndigoPlateauPokecenter1FPrepareElite4Callback:
	setmapscene WILLS_ROOM, SCENE_WILLSROOM_LOCK_DOOR
	setmapscene KOGAS_ROOM, SCENE_KOGASROOM_LOCK_DOOR
	setmapscene BRUNOS_ROOM, SCENE_BRUNOSROOM_LOCK_DOOR
	setmapscene KARENS_ROOM, SCENE_KARENSROOM_LOCK_DOOR
	setmapscene LANCES_ROOM, SCENE_LANCESROOM_LOCK_DOOR
	setmapscene HALL_OF_FAME, SCENE_HALLOFFAME_ENTER
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	endcallback

PlateauRivalBattle1:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	readvar VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	moveobject INDIGOPLATEAUPOKECENTER1F_RIVAL, 17, 9
	appear INDIGOPLATEAUPOKECENTER1F_RIVAL
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, RIGHT
	sjump PlateauRivalBattleCommon

PlateauRivalBattle2:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	readvar VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	appear INDIGOPLATEAUPOKECENTER1F_RIVAL
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, LEFT
PlateauRivalBattleCommon:
	opentext
	writetext PlateauRivalText1
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
        checkevent EVENT_BEAT_RIVAL4
        iftrue .Battle4
        checkevent EVENT_BEAT_RIVAL3
        iftrue .Battle3
        checkevent EVENT_BEAT_RIVAL2
        iftrue .Battle2
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL2
	sjump PlateauRivalPostBattle

.Totodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL2
	sjump PlateauRivalPostBattle

.Chikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL2
	sjump PlateauRivalPostBattle

.Battle2:
        checkevent EVENT_GOT_TOTODILE_FROM_ELM
        iftrue .Totodile2
        checkevent EVENT_GOT_CHIKORITA_FROM_ELM
        iftrue .Chikorita2
        loadtrainer RIVAL2, RIVAL2_3_TOTODILE
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL3
        sjump PlateauRivalPostBattle
.Totodile2:
        loadtrainer RIVAL2, RIVAL2_3_CHIKORITA
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL3
        sjump PlateauRivalPostBattle
.Chikorita2:
        loadtrainer RIVAL2, RIVAL2_3_CYNDAQUIL
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL3
        sjump PlateauRivalPostBattle

.Battle3:
        checkevent EVENT_GOT_TOTODILE_FROM_ELM
        iftrue .Totodile3
        checkevent EVENT_GOT_CHIKORITA_FROM_ELM
        iftrue .Chikorita3
        loadtrainer RIVAL2, RIVAL2_4_TOTODILE
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL4
        sjump PlateauRivalPostBattle
.Totodile3:
        loadtrainer RIVAL2, RIVAL2_4_CHIKORITA
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL4
        sjump PlateauRivalPostBattle
.Chikorita3:
        loadtrainer RIVAL2, RIVAL2_4_CYNDAQUIL
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_RIVAL4
        sjump PlateauRivalPostBattle
.Battle4:
        checkevent EVENT_GOT_TOTODILE_FROM_ELM
        iftrue .Totodile4
        checkevent EVENT_GOT_CHIKORITA_FROM_ELM
        iftrue .Chikorita4
        loadtrainer RIVAL2, RIVAL2_5_TOTODILE
        startbattle
        reloadmapafterbattle
        sjump PlateauRivalPostBattle
.Totodile4:
        loadtrainer RIVAL2, RIVAL2_5_CHIKORITA
        startbattle
        reloadmapafterbattle
        sjump PlateauRivalPostBattle
.Chikorita4:
        loadtrainer RIVAL2, RIVAL2_5_CYNDAQUIL
        startbattle
        reloadmapafterbattle
        sjump PlateauRivalPostBattle

PlateauRivalPostBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PlateauRivalText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalLeavesNewMovement
	disappear INDIGOPLATEAUPOKECENTER1F_RIVAL
	setscene SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
PlateauRivalScriptDone:
	end

IndigoPlateauPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

IndigoPlateauPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

IndigoPlateauPokecenter1FCooltrainerMScript:
	jumptextfaceplayer IndigoPlateauPokecenter1FCooltrainerMText

TeleportGuyScript:
	faceplayer
	opentext
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 13, 6
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end

PlateauRivalMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

PlateauRivalMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PlateauRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PlateauRivalLeavesNewMovement:
        step DOWN
        step_end

LigaLevelScript:
        faceplayer
        opentext
        checkcode VAR_REMATCHTOPFOUR
	checkevent EVENT_BEAT_ELITE_FOUR
        iftrue .LigaLevelWinScript
        writetext LigaLevelNoBadgesText
        waitbutton
        closetext
        end

.LigaLevelWinScript:
        readvar VAR_REMATCHTOPFOUR
        writetext LigaLevelWinText
        waitbutton

        checkcode VAR_REMATCHTOPFOURMAX
        ifequal 0, .max1
        ifequal 1, .max2
        ifequal 2, .max3
        ifequal 3, .max4
        ifequal 4, .max5

.max1:
        loadmenu LigaSelectLevel
        sjump .MenuEnd
.max2:
        loadmenu LigaSelectLevel2
        sjump .MenuEnd
.max3:
        loadmenu LigaSelectLevel3
        sjump .MenuEnd
.max4:
        loadmenu LigaSelectLevel4
        sjump .MenuEnd
.max5:
        loadmenu LigaSelectLevel5
        sjump .MenuEnd

.MenuEnd:
        verticalmenu
        closewindow
        ifequal 2, .LigaLevelOne
        ifequal 3, .LigaLevelTwo
        ifequal 4, .LigaLevelThree
        ifequal 5, .LigaLevelFour
        ifequal 6, .LigaLevelFive
        ifequal 1, .LigaLevelZero
        end

.LigaLevelOne:
        readvar VAR_REMATCHTOPFOUR
        setval 1
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaLevelTwo:
        readvar VAR_REMATCHTOPFOUR
        setval 2
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaLevelThree:
        readvar VAR_REMATCHTOPFOUR
        setval 3
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaLevelFour:
        readvar VAR_REMATCHTOPFOUR
        setval 4
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaLevelFive:
        readvar VAR_REMATCHTOPFOUR
        setval 5
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaLevelZero:
        readvar VAR_REMATCHTOPFOUR
        setval 0
        writevar VAR_REMATCHTOPFOUR
        sjump .LigaResetGyms
        end

.LigaResetGyms:
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
        text_decimal wRematchTopFour, 1, 1
        text "!"
        done

.YouChoseText:
        text "Du hast gewählt:"
        line "Lvl @"
;       text_decimal wScriptVar, 1, 1
        text_decimal wRematchTopFour, 1, 1
        text "!"

        para "Gegner werden"
        line "zurückgesetzt."
        done

LigaSelectLevel:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData
        db 1 ; default option
        end

.MenuData:
        db STATICMENU_CURSOR ; flags
        db 2 ; items
        db "0@"
        db "1@"
        end

LigaSelectLevel2:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData2
        db 1 ; default option
        end

.MenuData2:
        db STATICMENU_CURSOR ; flags
        db 3 ; items
        db "0@"
        db "1@"
        db "2@"
        end

LigaSelectLevel3:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData3
        db 1 ; default option
        end

.MenuData3:
        db STATICMENU_CURSOR ; flags
        db 4 ; items
        db "0@"
        db "1@"
        db "2@"
        db "3@"
        end

LigaSelectLevel4:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData4
        db 1 ; default option
        end

.MenuData4:
        db STATICMENU_CURSOR ; flags
        db 5 ; items
        db "0@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        end

LigaSelectLevel5:
        db MENU_BACKUP_TILES ; flags
;        menu_coords 0, 0, 5, TEXTBOX_Y - 1
        menu_coords 0, 0, 8, 17
        dw .MenuData5
        db 1 ; default option
        end

.MenuData5:
        db STATICMENU_CURSOR ; flags
        db 6 ; items
        db "0@"
        db "1@"
        db "2@"
        db "3@"
        db "4@"
        db "5@"
        end

IndigoPlateauPokecenter1FCooltrainerMText:
	text "In der #MON"
	line "LIGA stellen dich"

	para "die TOP VIER auf"
	line "eine harte Probe."

	para "Du musst sie alle"
	line "schlagen. Wenn du"

	para "verlierst, musst"
	line "du ganz von vorne"
	cont "anfangen!"
	done

PlateauRivalText1:
	text "Moment noch!"

	para "Akzeptierst du die"
	line "Herausforderung"

	para "der #MON LIGA?"
	line "Das wird nicht"
	cont "passieren."

	para "Meine perfekt"
	line "trainierten #-"
	cont "MON werden dich"
	cont "zermalmen."

	para "<PLAYER>!"

	para "Ich fordere dich"
	line "heraus!"
	done

PlateauRivalWinText:
	text "…"
	line "O.K. - Ich habe"

	para "verloren…"
	done

PlateauRivalText2:
	text "…Mist… Ich"
	line "kann nicht"
	cont "gewinnen…"

	para "Ich… ich muss mich"
	line "mehr um meine"
	cont "#MON kümmern…"

	para "Versuche, nicht"
	line "zu verlieren!"
	done

PlateauRivalLoseText:
	text "…"

	para "Wow…"
	line "Mit meinen"

	para "Partnern werde"
	line "ich der CHAMP"
	cont "sein!"
	done

TeleportGuyText1:
	text "Ah! Du forderst"
	line "also die TOP VIER"

	para "heraus? Bist du"
	line "wirklich bereit?"

	para "Wenn du mehr"
	line "trainieren willst,"

	para "kann dir mein"
	line "ABRA helfen."

	para "Es kann dich"
	line "nach Hause"
	cont "TELEPORTIEREN."

	para "Möchtest du jetzt"
	line "nach Hause?"
	done

TeleportGuyYesText:
	text "O.K. Stell"
	line "dir dein Haus"
	cont "vor…"
	done

TeleportGuyNoText:
	text "O.K. Alles"
	line "Gute!"
	done

AbraText:
	text "ABRA: Aabra…"
	done

LigaLevelWinText:
        text "Möchtest du dein"
        line "Rematch-LVL"

        para "ändern oder"
        line "zurücksetzen?"

        para "Aktuelles Lvl"
        line "ist: @"
        text_decimal wRematchTopFour, 1, 1
        text "!"
        done

LigaLevelNoBadgesText:
        text "Ich bin der"
        line "REMATCH VERMITTLER"

        para "Wenn du die Liga"
        line "besiegt hast,"

        para "kannst du die"
        line "sie zu einem"

        para "Rematch heraus-"
        line "fordern."
        done

IndigoPlateauPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ROUTE_23, 1
	warp_event  6, 13, ROUTE_23, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 14,  3, WILLS_ROOM, 1

	def_coord_events
;	coord_event 16,  4, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattle1
;	coord_event 17,  4, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattle2

	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FNurseScript, -1
	object_event 11,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FClerkScript, -1
	object_event 11, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FCooltrainerMScript, -1
	object_event 14,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlateauRivalBattleCommon, -1
	object_event  1,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event  0,  9, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
        object_event 16,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LigaLevelScript, -1
