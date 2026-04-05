extends Sprite2D

@onready var panel: Panel = %Panel


func _ready() -> void:
	panel.visible = false
	
	pass

func _on_tap_area_pressed() -> void:
	panel.visible = true
	
	pass # Replace with function body.

func spawn_tower(p_tower_data:TowerData):
	Tower.spawn_tower(self.global_position,p_tower_data )
	queue_free()
	
	pass

var laser_data:TowerData = preload("res://data/towers/laser_tower.tres")
func _on_button_pressed() -> void:
	spawn_tower(laser_data)

var plasma_data:TowerData = preload("res://data/towers/plasma_tower.tres")
func _on_button_2_pressed() -> void:
	spawn_tower(plasma_data)

var railgun_data:TowerData = preload("res://data/towers/railgun_tower.tres")
func _on_button_3_pressed() -> void:
	spawn_tower(railgun_data)
