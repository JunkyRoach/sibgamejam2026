extends Node

@export var path:Path2D
@onready var timer: Timer = $Timer

@export var test_mobs:Array[EnemyData] = []

func _ready() -> void:
	#GameController.batlle_started.connect(spawn_mobs)
	
	pass



func spawn_mobs():
	for enemy:EnemyData in GameController.mission_data.waves[GameController.current_wave].enemies_in_wave:
		path.add_child(Enemy.instantiate(enemy))
		await get_tree().create_timer(0.5).timeout
		print(enemy)
	
	pass


func _on_timer_timeout() -> void:
	path.add_child(Enemy.instantiate(test_mobs.pick_random()))
	pass # Replace with function body.
