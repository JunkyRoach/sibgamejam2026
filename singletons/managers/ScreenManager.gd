extends RefCounted
class_name ScreenManager

static var _main_menu_screen:MainMenuScreen
static var _battle_screen:BattleScreen
static var _select_mission_screen:SelectMissionScreen


static var current_screen:ScreenBase



static func show_main_menu():
	_clear_current_screen()
	if _main_menu_screen == null:
		_main_menu_screen = MainMenuScreen.main_menu_scene.instantiate()
	
	current_screen = _main_menu_screen
	Layers.SCREEN_LAYER.add_child(_main_menu_screen)
	
	pass

static func show_select_mission_screen():
	_clear_current_screen()
	if _select_mission_screen == null:
		_select_mission_screen = SelectMissionScreen.select_mission_screen_scene.instantiate()
	
	current_screen = _select_mission_screen
	Layers.SCREEN_LAYER.add_child(_select_mission_screen)
	
	pass

static func show_battle_screen(p_mission_data:MissionData):
	_clear_current_screen()
	if _battle_screen == null:
		_battle_screen = BattleScreen.battle_screen_scene.instantiate()
	
	current_screen = _battle_screen
	Layers.SCREEN_LAYER.add_child(_battle_screen)
	_battle_screen.start_battle(p_mission_data)
	
	pass


static func _clear_current_screen():
	if current_screen != null:
		current_screen.destroy()
	
	pass
