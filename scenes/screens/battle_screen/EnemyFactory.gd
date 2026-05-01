extends Node

@export var enemy_layer:Node2D
@onready var timer: Timer = $Timer

@export var test_mobs:Array[EnemyData] = []

func _ready() -> void:
	randomize()
	pass



func spawn_mobs():
	var enemy = Enemy.instantiate(test_mobs.pick_random())
	var demon_pos:=Demon.demon.global_position
	match randi_range(0,3):
		0:enemy.global_position =demon_pos + Vector2(randf_range(-640,640), -400)
		1:enemy.global_position = demon_pos + Vector2(randf_range(-640,640), 400)
		2:enemy.global_position = demon_pos + Vector2(-640, randf_range(-400,400))
		3:enemy.global_position = demon_pos + Vector2(640, randf_range(-400,400))
	
	#enemy.look_at(Demon.demon.global_position)
	enemy.direction = enemy.global_position.direction_to(Demon.demon.global_position)
	
	enemy_layer.add_child(enemy)
	
	pass


func _on_timer_timeout() -> void:
	spawn_mobs()
	
