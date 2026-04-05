extends ScreenBase
class_name BattleScreen

static var battle_screen_scene:PackedScene = preload("res://scenes/screens/battle_screen/BattleScreen.tscn")

static var screen:BattleScreen


var mission_data:MissionData

func _ready() -> void:
	screen = self
	pass
	
func start_battle(p_mission_data:MissionData):
	mission_data = p_mission_data
	GameController.start_battle(mission_data)
	


func destroy():
	self.queue_free()
	pass

func _on_timer_timeout() -> void:
	pass # Replace with function body.
