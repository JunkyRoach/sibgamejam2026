extends Node2D

@export var mission_data:MissionData


@onready var mission_label: Label = %MissionLabel


func _ready() -> void:
	
	pass
	
func _update_icon():
	mission_label.text = mission_data.title
	pass	


func _on_tap_area_pressed() -> void:
	BattleScreen.show_screen(mission_data)
	pass # Replace with function body.
