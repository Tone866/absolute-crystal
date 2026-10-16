	object_const_def
	const TOHJOFALLS_POKE_BALL
	const TOHJOFALLS_GIOVANNI

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks

GiovanniScript_Battle:
	faceplayer
        opentext
        writetext GiovanniStartText
        waitbutton
        closetext
        winlosstext GiovanniWinLossText, 0
        checkcode VAR_BADGES
        if_greater_than 15, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Battle2
        loadtrainer GIOVANNI, GIOVANNI1
.next:
        startbattle
        reloadmapafterbattle
        opentext
        writetext GiovanniBattleEndText
        waitbutton
        closetext
        playsound SFX_STRENGTH
        earthquake 80
	pause 40
	warp ROUTE_27, 26, 5
        end

.Battle2:
        loadtrainer GIOVANNI, 2
	sjump .next
.Battle3:
        loadtrainer GIOVANNI, 3
	sjump .next

TohjoFallsMoonStone:
	itemball MOON_STONE

GiovanniStartText:
	text "Verschwinde!"
	done

GiovanniWinLossText:
        text "Geschlagen von"
	line "einem Kind..."
        done

GiovanniBattleEndText:
        text "...!"
        done

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
        object_event  3,  6, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GiovanniScript_Battle, -1
