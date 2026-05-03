extends Control
class_name PerkIcon

signal perk_selected

@onready var icon_texture_rect: TextureRect = %IconTextureRect
@onready var title: Label = %Title
@onready var description: Label = %Description

var upgrade_data:Resource

func update_data(p_upgrade_data:Resource):
	icon_texture_rect.texture = p_upgrade_data.icon_texture
	title.text = p_upgrade_data.title
	description.text = p_upgrade_data.description
	upgrade_data = p_upgrade_data	
	pass


func _on_texture_button_pressed() -> void:
	upgrade_data.use_perk()
	perk_selected.emit()
	pass # Replace with function body.
