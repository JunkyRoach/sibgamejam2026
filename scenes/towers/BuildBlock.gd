extends Sprite2D

@onready var panel: Panel = %Panel


func _ready() -> void:
	panel.visible = false
	
	pass

func _on_tap_area_pressed() -> void:
	panel.visible = true
	
	pass # Replace with function body.

func spawn_tower():
	Tower.spawn_tower(self.global_position)
	queue_free()
	
	pass

func _on_button_pressed() -> void:
	spawn_tower()


func _on_button_2_pressed() -> void:
	spawn_tower()


func _on_button_3_pressed() -> void:
	spawn_tower()
