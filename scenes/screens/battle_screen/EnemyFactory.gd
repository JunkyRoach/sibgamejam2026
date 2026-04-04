extends Node

@export var enemy_layer:Node2D
@onready var timer: Timer = $Timer

@export var test_mobs:Array[EnemyData] = []

func _ready() -> void:
	randomize()
	#GameController.batlle_started.connect(spawn_mobs)
	
	pass



func spawn_mobs():
	for enemy:EnemyData in GameController.mission_data.waves[GameController.current_wave].enemies_in_wave:
		enemy_layer.add_child(Enemy.instantiate(enemy))
		await get_tree().create_timer(0.5).timeout
		print(enemy)
	
	pass


func _on_timer_timeout() -> void:
	var enemy = Enemy.instantiate(test_mobs.pick_random())
	if randf() > 0.5:
		enemy.global_position = Vector2(randf_range(0,1280), 0)
	else:
		enemy.global_position = Vector2(randf_range(0,1280), 720)
	
	enemy.look_at(Tower.tower.global_position)
	enemy.direction = enemy.global_position.direction_to(Tower.tower.global_position)
	
	enemy_layer.add_child(enemy)
	pass # Replace with function body.
