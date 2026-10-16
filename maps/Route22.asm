	object_const_def
        const ROUTE22_LAVADOS

Route22_MapScripts:
	def_scene_scripts

	def_callbacks

Lavados:
        faceplayer
        cry MOLTRES
        loadwildmon MOLTRES, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
        startbattle
        disappear ROUTE22_LAVADOS
        setevent EVENT_FOUGHT_LAVADOS
        reloadmapafterbattle
        end

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LIGA"

	para "SIEGESSTRASSE"
	line "EINGANG"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
        object_event 32, 2, SPRITE_BIRDSTILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Lavados, EVENT_FOUGHT_LAVADOS
