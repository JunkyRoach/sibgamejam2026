extends ScreenBase
class_name BattleScreen

static var battle_screen_scene:PackedScene = preload("res://scenes/screens/battle_screen/BattleScreen.tscn")

static var screen:BattleScreen


func _ready() -> void:
	screen = self
	pass
	
func start_battle():
	GameController.start_battle()
	UpgradeStorage.reset_stats()
	


func destroy():
	self.queue_free()
	pass

func _on_timer_timeout() -> void:
	pass # Replace with function body.
