extends Node

signal batlle_started

signal mission_lose
signal level_up_signal

var experience:int
var level:=1
var need_exp_to_lvl:=6

func start_battle():
	level = 1
	experience = 0
	need_exp_to_lvl = 6
	batlle_started.emit()
	pass

func soul_added():
	experience+=1
	if experience>=need_exp_to_lvl:
		level_up()
		
	pass
	
func level_up():
	level+=1
	experience = 0
	need_exp_to_lvl += 6
	level_up_signal.emit()
	if level >= 100:
		ScreenManager.show_main_menu(true)
	
	pass	
	
func game_over():
	mission_lose.emit()
	ScreenManager.show_main_menu(false,true)
	

func enemy_reach_end(p_enemy_data:EnemyData):
	
	mission_lose.emit()
	ScreenManager.show_main_menu()
	pass
