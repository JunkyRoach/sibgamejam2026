extends Node
class_name Layers


static var SCREEN_LAYER:CanvasLayer
static var BATTLE_LAYER:CanvasLayer
static var HUD_LAYER:CanvasLayer
static var WINDOW_LAYER:CanvasLayer


func _ready() -> void:
	SCREEN_LAYER = %ScreenLayer
	HUD_LAYER = %HUDLayer
	WINDOW_LAYER = %WindowLayer
	BATTLE_LAYER = %BattleLayer
	pass
