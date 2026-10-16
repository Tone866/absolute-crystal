	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	checkcode VAR_BADGES
	if_greater_than 7, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
        checkcode VAR_BADGES
        if_greater_than 7, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text "Hallo! Willkommen"
	line "in der #KOM-"
	cont "CENTER-TAUSCHECKE."

	para "Du kannst hier"
	line "mit wildfremden"
	para "und weit entfern-"
	line "ten Trainern"
	cont "#MON tauschen."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "Zum Tauschen"
	line "bewahren wir dein"
	para "#MON bei uns"
	line "auf."
	para "Möchtest du gerne"
	line "tauschen?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "Welches #MON"
	line "erhoffst du dir"
	cont "im Gegenzug?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "Gut, wir werden"
	line "versuchen dein"

	para "@"
	text_ram wStringBuffer3
	text " gegen"
	line "@"
	text_ram wStringBuffer4
	text ""
	cont "zu tauschen."

	para "Wir nehmen dein"
	line "#MON jetzt"
	cont "entgegen."

	para "Der Raum wird"
	line "nun vorbereitet…"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "Gut, wir werden"
	line "versuchen dein"

	para "@"
	text_ram wStringBuffer3
	text ""

	line "gegen ein #MON"
	para "zu tauschen, dem"
	line "du bisher noch"
	para "nicht begegnet"
	line "bist."

	para "Wir nehmen dein"
	line "#MON jetzt"
	cont "entgegen."

	para "Der Raum wird"
	line "nun vorbereitet…"
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "Dein #MON wurde"
	line "entgegengenommen."
	para "Einen Tausch-"
	line "partner zu finden"
	para "kann ein wenig"
	line "dauern, also"
	para "komm später wieder"
	line "vorbei."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Oh? Du hast nur"
	line "ein #MON in"
	cont "deinem Team."

	para "Bitte komm wieder,"
	line "wenn du dein Team"
	cont "vergrößert hast."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Übertragungs-"
	line "fehler."
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "Würden wir dieses"
	line "#MON entgegen-"
	cont "nehmen, hättest"
	para "du keine #MON"
	line "mehr zum Kämpfen"
	cont "übrig."
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Tut mir Leid, aber"
	line "wir können kein EI"
	cont "annehmen."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Mit diesem #MON"
	line "scheint etwas"
	cont "nicht in Ordnung"
	cont "zu sein."

	para "Wir können es"
	line "daher nicht"
	cont "entgegennehmen."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Oh? Haben wir"
	line "nicht schon eines"
	para "deiner #MON"
	line "entgegengenommen?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "Wir überprüfen die"
	line "Räume für dich."

	para "Bitte warte einen"
	line "Moment…"
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Danke, dass du"
	line "gewartet hast."

	para "Ein Tauschpartner"
	line "wurde gefunden!"
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "Hier ist dein"
	line "neuer Freund!"

	para "Kümmere dich gut"
	line "um ihn."

	para "Komm jederzeit"
	line "wieder vorbei."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Oh, oh. Dein Team"
	line "ist schon voll"
	cont "besetzt."

	para "Schaffe Platz in"
	line "deinem Team und"
	cont "komm dann wieder."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "Leider konnte"
	line "bisher kein"
	para "Tauschpartner"
	line "gefunden werden."

	para "Möchtest du dein"
	line "#MON zurück?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "Hier hast du dein"
	line "#MON zurück."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "Leider konnte"
	line "bisher kein"
	para "Tauschpartner"
	line "gefunden werden."

	para "Da wir dein"
	line "#MON bereits"
	para "sehr lange aufbe-"
	line "wahren, fühlt es"
	para "sich mittlerweile"
	line "ziemlich einsam."

	para "Wir geben es dir"
	line "vorerst zurück…"
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "In Ordnung, wir"
	line "werden dein"
	para "#MON noch eine"
	line "Weile aufbewahren."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Oh? Du hast uns"
	line "dein #MON erst"
	para "kürzlich"
	line "anvertraut."

	para "Komm bitte später"
	line "wieder."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text "Das Spiel wird"
	line "gesichert, ehe"
	para "die Verbindung zum"
	line "MOBILEN CENTER"
	cont "aufgebaut wird."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Welches deiner"
	line "#MON bietest"
	cont "du zum Tausch an?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Tut mir Leid, aber"
	line "der Tausch wurde"
	cont "abgebrochen."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Oh! Wie ich sehe,"
	line "besitzt du ein EI-"
	cont "TICKET!"

	para "Dieser Coupon kann"
	line "gegen ein besonde-"
	para "res #MON"
	line "eingelöst werden"
	para "und ist nur für"
	line "besondere Leute"
	para "bestimmt!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Lass mich dir eine"
	line "kurze Einweisung"
	cont "geben!"

	para "In der TAUSCHECKE"
	line "kannst du über"
	para "größere Entfer-"
	line "nungen tauschen,"
	para "weshalb dieser"
	line "Vorgang etwas"
	para "Zeit in Anspruch"
	line "nehmen kann."

	para "Das KURIOS-EI"
	line "hingegen wurde"
	para "extra nur für dich"
	line "hinterlegt und"
	para "kann dir sofort"
	line "übersendet werden."

	para "Einer der vielen"
	line "Räume im CENTER"
	para "wird ausgewählt,"
	line "um dir von dort"
	para "das KURIOS-EI"
	line "zu übersenden."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Bitte warte"
	line "einen Moment."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Danke, dass du"
	line "gewartet hast."

	para "Wir haben dein"
	line "KURIOS-EI"
	cont "empfangen!"

	para "Bitte schön!"

	para "Bitte ziehe es in"
	line "liebevoller Pflege"
	cont "auf."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "Tut mir Leid, aber"
	line "der EI-TICKET-Aus-"
	cont "tausch-Dienst ist"

	para "momentan nicht"
	line "verfügbar."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "Das ist eine #-"
	line "MON-NACHRICHTEN-"
	cont "MASCHINE!"
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "Was möchtest du"
	line "tun?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "#MON-NACHRICH-"
	line "TEN werden aus"
	para "den SPIELSTÄNDEN"
	line "verschiedener"
	para "Trainer zusammen-"
	line "gestellt."

	para "Dein SPIELSTAND"
	line "kann übertragen"
	para "werden, wenn du"
	line "neue NACHRICHTEN"
	cont "abrufst."

	para "Der SPIELSTAND"
	line "enthält Aufzeich-"
	para "nungen deines"
	line "Abenteuers und"
	cont "dein Mobilprofil."

	para "Deine Rufnummer"
	line "wird dabei nicht"
	cont "übertragen."

	para "Der Inhalt der"
	line "NACHRICHTEN hängt"
	para "von den SPIELSTÄN-"
	line "DEN aller Teil-"
	cont "nehmer ab."

	para "Vielleicht taucht"
	line "auch dein Name"
	para "eines Tages in"
	line "den NACHRICHTEN"
	cont "auf!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Möchtest du die"
	line "neusten NACH-"
	cont "RICHTEN abrufen?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Die neusten"
	line "NACHRICHTEN"
	cont "werden empfangen…"
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "Noch wurden keine"
	line "NACHRICHTEN"
	cont "empfangen."
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "Die NACHRICHTEN"
	line "sind beschädigt."

	para "Bitte lade die"
	line "NACHRICHTEN erneut"
	cont "herunter."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "Wir treffen noch"
	line "Vorbereitungen."

	para "Komm bitte später"
	line "wieder."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "Ehe du die"
	line "NACHRICHTEN-"
	para "MASCHINE bedienst,"
	line "wird dein Spiel-"
	cont "stand gesichert."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "I thought up a fun"
	line "new thing for the"
	cont "TRADE CORNER!"

	para "I make a PIDGEY"
	line "hold MAIL, then"

	para "put it up for"
	line "trade for another"
	cont "one!"

	para "If everyone did"
	line "that, MAIL could"

	para "be traded with all"
	line "sorts of people!"

	para "I call it PIDGEY"
	line "MAIL!"

	para "If it becomes"
	line "popular, I might"

	para "make lots of new"
	line "friends!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "They said you can"
	line "trade #MON with"

	para "total strangers up"
	line "here."

	para "But they're still"
	line "adjusting things."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Some girl I don't"
	line "know sent me her"

	para "HOPPIP."
	line "You should trade"

	para "for a #MON that"
	line "you want."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "I received a"
	line "female HOPPIP, but"
	cont "its named STANLEY!"

	para "That's my dad's"
	line "name!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "What is the NEWS"
	line "MACHINE?"

	para "Does it get news"
	line "from a wider area"
	cont "than the radio?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "My friend was in"
	line "the NEWS a while"

	para "back. I was really"
	line "surprised!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "I get anxious if I"
	line "don't check out"
	cont "the latest NEWS!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Im oberen Stock-"
	line "werk findest du"

	para "das KOLOSSEUM."
	line "Hier kannst du"

	para "gegen Freunde"
	line "antreten."

	para "Kampfergebnisse"
	line "werden an der Wand"

	para "ausgehängt. Ich"
	line "kann es mir nicht"

	para "erlauben, zu ver-"
	line "lieren."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "I came over here"
	line "when I got word"

	para "that GOLDENROD's"
	line "#MON CENTER has"

	para "new machines that"
	line "no one's ever seen"
	cont "before."

	para "But it looks like"
	line "they're still busy"

	para "with all their"
	line "preparations…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, oder?"

	para "Glückwunsch!"

	para "Nur für dich wurde"
	line "ein GS-BALL"
	cont "geschickt!"

	para "Nimm ihn bitte!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Beehre uns bald"
	line "wieder!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#KOM-CENTER"

	para "EG INFORMATIONEN"

	para "Links: VERWALTUNG"

	para "Mitte: TAUSCHECKE"

	para "Rechts: #MON-"
	line "NACHRICHTEN"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "Das ist eine #-"
	line "MON NACHRICHTEN-"
	cont "MASCHINE!"

	para "Sie ist noch nicht"
	line "in Betrieb…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh, dein Beutel"
	line "sieht schwer aus!"

	para "Oh! Hast du zufäl-"
	line "lig etwas, das man"
	cont "ANARA-BRIEF nennt?"

	para "Meine Tochter"
	line "sucht danach."

	para "Du gibst mir doch"
	line "einen, nicht wahr?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "ANARA-BRIEF"
	line "weggeben?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, großartig!"
	line "Danke, Schatz!"

	para "Hier, als Aus-"
	line "gleich sollst"
	cont "du das haben!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Meine Tochter wird"
	line "entzückt sein!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Du hast"
	line "keinen? Schade."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Ein anderes"
	line "Mal vielleicht."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gibt den"
	line "ANARA-BRIEF weg."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
