extends ScreenBase
class_name MainMenuScreen

static var main_menu_scene:=preload("res://scenes/screens/main_menu_screen/MainMenuScreen.tscn")

static var screen:MainMenuScreen

@export var win_texture:Texture2D
@export var lose_texture:Texture2D
@onready var bkg: TextureRect = %BKG
@onready var name_icon: Sprite2D = %Name

func _ready() -> void:
	screen = self
	pass


func show_win():
	bkg.texture = win_texture
	name_icon.visible = false
	pass
	
func show_loose():
	bkg.texture = lose_texture
	name_icon.visible = false
	pass

func destroy():
	self.queue_free()
	pass
