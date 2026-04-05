extends ScreenBase
class_name MainMenuScreen

static var main_menu_scene:=preload("res://scenes/screens/main_menu_screen/MainMenuScreen.tscn")

static var screen:MainMenuScreen


func _ready() -> void:
	screen = self
	pass


func destroy():
	self.queue_free()
	pass
