TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadtemptrainer
	encountermusic
	sjump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadtemptrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	sjump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript:
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	closetext
	loadtemptrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadmem wRunningTrainerBattleScript, -1
	scripttalkafter
	end

AlreadyBeatenTrainerScript:
        opentext
        writetext RematchText
        yesorno
        iffalse .no
        closetext
        loadtemptrainer
        startbattle
        reloadmapafterbattle
        loadmem wRunningTrainerBattleScript, -1
	end
.no:
;	closetext
	scripttalkafter
	end

RematchText:
        text "Willst du eine"
	line "Revanche?"
        done
