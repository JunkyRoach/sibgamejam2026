extends Node2D


@onready var mission_label: Label = %MissionLabel


func _ready() -> void:
	
	pass
	


func _on_tap_area_pressed() -> void:
	ScreenManager.show_battle_screen()
	
