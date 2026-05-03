extends Control


@onready var level_animation_player: AnimationPlayer = %LevelAnimationPlayer
@export var perk_icon_list:Array[PerkIcon] = []

func _ready() -> void:
	GameController.level_up_signal.connect(show_level_up_window)
	

func show_level_up_window():
	
	level_animation_player.play("show_level_up")
	get_tree().paused = true
	UpgradeStorage.perk_list.shuffle()
	
	for i in 3:
		perk_icon_list[i].update_data(UpgradeStorage.perk_list[i])
		
		pass
	

func _on_button_pressed() -> void:
	level_animation_player.play("hide_level_up")
	get_tree().paused = false
