extends Node2D
class_name BattleScreen

static var screen:BattleScreen

static func show_screen(p_mission_data:MissionData):
	MainMenuScreen.hide_screen()
	
	screen.visible = true
	screen.set_process(true)
	screen._update_data(p_mission_data)
	ScreenController.battle_screen_loaded.emit()
	

static func hide_screen():
	screen.visible = false
	screen.set_process(false)



var mission_data:MissionData

func _ready() -> void:
	screen = self
	pass
	
	
func _update_data(p_mission_data:MissionData):
	mission_data = p_mission_data
	GameController.start_battle(mission_data)



func _on_timer_timeout() -> void:
	pass # Replace with function body.
