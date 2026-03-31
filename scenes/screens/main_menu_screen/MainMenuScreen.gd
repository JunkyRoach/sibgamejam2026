extends Node2D
class_name MainMenuScreen

static var screen:MainMenuScreen


static func show_screen():
	BattleScreen.hide_screen()
	screen.visible = true
	screen.set_process(true)
	ScreenController.main_menu_screen_loaded.emit()

static func hide_screen():
	screen.visible = false
	screen.set_process(false)
	

func _ready() -> void:
	screen = self
	pass
