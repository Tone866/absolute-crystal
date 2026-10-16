	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
        checkflag ENGINE_MINERALBADGE
        iffalse .nobadge
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
        checkcode VAR_REMATCHJOHTO
        if_greater_than 0, .GymRematch
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end
.nobadge:
        writetext PryceNobadge
        waitbutton
        closetext
        end
.GymRematch:
        writetext PRYCERematchText
        waitbutton
        closetext
        winlosstext PRYCERematchLossText, 0
        checkcode VAR_REMATCHJOHTO
        ifequal 1, .GymRematchOne
        ifequal 2, .GymRematchTwo
        ifequal 3, .GymRematchThree
        ifequal 4, .GymRematchFour
        ifequal 5, .GymRematchFive
        ifequal 6, .GymRematchSix
        ifequal 7, .GymRematchSeven
.GymRematchOne:
        loadtrainer PRYCE, 2
        sjump .FinishedLoadingTrainer
.GymRematchTwo:
        loadtrainer PRYCE, 3
        sjump .FinishedLoadingTrainer
.GymRematchThree:
        loadtrainer PRYCE, 4
        sjump .FinishedLoadingTrainer
.GymRematchFour:
        loadtrainer PRYCE, 5
        sjump .FinishedLoadingTrainer
.GymRematchFive:
        loadtrainer PRYCE, 6
        sjump .FinishedLoadingTrainer
.GymRematchSix:
        loadtrainer PRYCE, 7
        sjump .FinishedLoadingTrainer
.GymRematchSeven:
        loadtrainer PRYCE, 8
        sjump .FinishedLoadingTrainer

.FinishedLoadingTrainer:
        startbattle
        reloadmapafterbattle
        setevent EVENT_BEAT_PRYCE
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

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceNobadge:
        text "Du brauchst min."
        line "6 Orden um mich"

        para "herausfordern zu"
        line "können. Komm"

        para "später wieder,"
        line "ich werde hier"

        para "auf dich warten."
        done

PRYCERematchText:
        text "Eine Revanche?"
        line "Alles klar,"

        para "aber ich bin"
        line "stärker geworden!"
        done
PRYCERematchLossText:
        text "Ich werde weiter"
        line "trainieren..."
        done

PryceText_Intro:
	text "#MON machen in"
	line "ihrem Leben viele"

	para "Erfahrungen. Genau"
	line "wie Menschen."

	para "Auch ich habe in"
	line "meinem Leben viel"
	cont "gesehen und er-"
	cont "litten."

	para "Da ich der Ältere"
	line "bin, lass mich dir"
	cont "zeigen, was ich"
	cont "meine."

	para "Ich war schon mit"
	line "#MON zusammen,"

	para "bevor du geboren"
	line "wurdest."

	para "Ich verliere nicht"
	line "gerne."

	para "Ich, NORBERT, der"
	line "Wintertrainer,"

	para "werde meine Macht"
	line "demonstrieren!"
	done

PryceText_Impressed:
	text "Ich bin von deinem"
	line "Können beein-"
	cont "druckt."

	para "Mit deinem starken"
	line "Willen, wirst du"

	para "alle Widrigkeiten"
	line "in deinem Leben"
	cont "überstehen."

	para "Du bist dieses"
	line "ORDENS würdig!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> erhält"
	line "EISORDEN."
	done

PryceText_GlacierBadgeSpeech:
	text "Dieser ORDEN hebt"
	line "den SPEZ-Wert dei-"
	cont "ner #MON."

	para "Außerdem können"
	line "deine #MON"
	cont "WHIRLPOOL einset-"
	cont "zen, um echte"
	cont "Strudel zu"
	cont "überwinden."

	para "Und dies… dies ist"
	line "ein Geschenk von"
	cont "mir!"
	done

PryceText_IcyWindSpeech:
	text "Diese TM enthält"
	line "EISSTURM."

	para "Sie verursacht"
	line "Schaden und ver-"
	cont "ringert die Ge-"
	cont "schwindigkeit."

	para "Sie stellt die"
	line "Härte des Winters"
	cont "dar."
	done

PryceText_CherishYourPokemon:
	text "Wenn Eis und"
	line "Schnee geschmolzen"
	cont "sind, kehrt der"
	cont "Frühling wieder."

	para "Du und deine"
	line "#MON werden"

	para "noch viele Jahre"
	line "zusammen sein."

	para "Genießt eure ge-"
	line "meinsame Zeit!"
	done

BoarderRonaldSeenText:
	text "Ich werde deine"
	line "#MON einfrie-"
	cont "ren, so dass sie"
	cont "sich nicht bewegen"
	cont "können."
	done

BoarderRonaldBeatenText:
	text "Mist! Ich konnte"
	line "nichts tun."
	done

BoarderRonaldAfterBattleText:
	text "Ich glaube, es"
	line "gibt eine Attacke,"

	para "die #MON"
	line "auch ausführen"

	para "können, wenn sie"
	line "gefroren sind."
	done

BoarderBradSeenText:
	text "Diese PKMN-ARENA"
	line "hat einen rutschi-"
	cont "gen Boden. Das ist"
	cont "doch lustig, oder?"

	para "Aber wir sind"
	line "nicht hier, um zu"
	cont "spielen!"
	done

BoarderBradBeatenText:
	text "Siehst du jetzt,"
	line "wie ernst wir es"
	cont "meinen?"
	done

BoarderBradAfterBattleText:
	text "Diese PKMN-ARENA"
	line "ist toll. Ich"
	cont "liebe es, mit mei-"
	cont "nen #MON hier"
	cont "zu snowboarden!"
	done

BoarderDouglasSeenText:
	text "Ich kenne NORBERTs"
	line "Geheimnis."
	done

BoarderDouglasBeatenText:
	text "O.K. Ich verrate"
	line "dir NORBERTs Ge-"
	cont "heimnis."
	done

BoarderDouglasAfterBattleText:
	text "Das Geheimnis von"
	line "NORBERTs Kraft…"

	para "Er meditiert täg-"
	line "lich unter einem"

	para "Wasserfall, um"
	line "Geist und Körper"
	cont "zu stärken."
	done

SkierRoxanneSeenText:
	text "Um zu NORBERT, un-"
	line "serem ARENALEITER,"

	para "zu gelangen, musst"
	line "du denken, bevor"
	cont "du loslegst."
	done

SkierRoxanneBeatenText:
	text "Beim Skifahren"
	line "würde ich nie ge-"
	cont "gen dich verlie-"
	cont "ren."
	done

SkierRoxanneAfterBattleText:
	text "Wenn du nicht ge-"
	line "nau rutschst,"

	para "kommst du in die-"
	line "ser PKMN-ARENA"
	cont "nicht weit."
	done

SkierClarissaSeenText:
	text "Sieh dir meinen"
	line "Parallelschwung"
	cont "an!"
	done

SkierClarissaBeatenText:
	text "Nein! Jetzt bin"
	line "ich weggerutscht!"
	done

SkierClarissaAfterBattleText:
	text "Ich hätte mit mei-"
	line "nen Ski-Künsten"
	cont "nicht so angeben"
	cont "sollen…"
	done

MahoganyGymGuideText:
	text "NORBERT ist ein"
	line "Veteran, der seine"

	para "#MON schon"
	line "seit fast 50 Jah-"
	cont "ren trainiert."

	para "Angeblich friert"
	line "er seine Gegner"

	para "gerne mit Eis-"
	line "Attacken ein."

	para "Das heißt, du"
	line "solltest ihn mit"

	para "deinem brennenden"
	line "Ehrgeiz schmelzen!"
	done

MahoganyGymGuideWinText:
	text "NORBERT ist nicht"
	line "übel, aber du"
	cont "bist noch besser!"

	para "Das war ein heißer"
	line "Kampf, der die"

	para "Kluft zwischen den"
	line "Generationen über-"
	cont "wunden hat."
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
