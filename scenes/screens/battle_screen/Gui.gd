extends Control


@onready var level_progress_bar: ProgressBar = %LevelProgressBar
@onready var level_label: Label = %LevelLabel

func _ready() -> void:
	
	GameController.level_up_signal.connect(_update_label)
	pass


func _update_label():
	level_label.text = 'LVL:'+ str(GameController.level)
	
	pass

func _process(delta: float) -> void:
	level_progress_bar.max_value = GameController.need_exp_to_lvl
	level_progress_bar.value = GameController.experience
	
	pass
