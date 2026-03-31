extends Node

signal batlle_started

signal mission_lose

var mission_data:MissionData
var mission_hp:int = 5

var game_currency:int
var current_wave:int

func start_battle(p_mission_data:MissionData):
	mission_data = p_mission_data
	game_currency = mission_data.start_game_currency
	current_wave = 0
	batlle_started.emit()
	pass



func enemy_reach_end(p_enemy_data:EnemyData):
	mission_hp -=p_enemy_data.reach_path_damage
	if mission_hp <= 0:
		mission_lose.emit()
		MainMenuScreen.show_screen()
	pass
