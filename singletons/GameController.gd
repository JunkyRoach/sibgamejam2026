extends Node

signal batlle_started

signal mission_lose



func start_battle():

	
	batlle_started.emit()
	pass



func enemy_reach_end(p_enemy_data:EnemyData):
	
	mission_lose.emit()
	ScreenManager.show_main_menu()
	pass
