extends ScreenBase
class_name MainMenuScreen

static var main_menu_scene:=preload("res://scenes/screens/main_menu_screen/MainMenuScreen.tscn")

static var screen:MainMenuScreen


func _ready() -> void:
	screen = self
	_update_labels()
	pass


func destroy():
	self.queue_free()
	pass



func _update_labels():
	%LaserRapidness.text = "Laser Rapidness:=" +str(TowerStorage.laser_tower.rapidness)
	%LaserDamage.text = "Laser Damage:=" +str(TowerStorage.laser_tower.damage)
	
	pass


func _on_upgrade_laser_button_pressed() -> void:
	TowerStorage.upgrade_laser_tower_rapidness()
	_update_labels()
	pass # Replace with function body.


func _on_upgrade_laser_damage_button_pressed() -> void:
	TowerStorage.upgrade_laser_tower_damage()
	_update_labels()
	pass # Replace with function body.
