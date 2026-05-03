extends Node

@export var enemy_layer:Node2D
@onready var timer: Timer = $Timer

@export var test_mobs:Array[EnemyData] = []
@export var peasant:EnemyData
@export var lancer:EnemyData
@export var swordsman:EnemyData
@export var horce_warrior:EnemyData


func _ready() -> void:
	randomize()
	mob_counter = 0
	pass

var mob_counter:int

func spawn_mobs():
	mob_counter+=1
	var enemy:Enemy
	if mob_counter<500:
		enemy = Enemy.instantiate(peasant)
	elif mob_counter < 600:
		if randf_range(0,100) < 80:
			
			enemy = Enemy.instantiate(peasant)
		else:
			enemy = Enemy.instantiate(lancer)
	elif mob_counter < 1000:
		if randf_range(0,100) < 50:	
			enemy = Enemy.instantiate(peasant)
		else:
			if randf_range(0,100) < 50:
				enemy = Enemy.instantiate(lancer)
			else:
				enemy = Enemy.instantiate(swordsman)
	else:
			enemy = Enemy.instantiate(test_mobs.pick_random())
	
	
	
	var demon_pos:=Demon.demon.global_position
	match randi_range(0,3):
		0:enemy.global_position =demon_pos + Vector2(randf_range(-640,640), -400)
		1:enemy.global_position = demon_pos + Vector2(randf_range(-640,640), 400)
		2:enemy.global_position = demon_pos + Vector2(-640, randf_range(-400,400))
		3:enemy.global_position = demon_pos + Vector2(640, randf_range(-400,400))
	
	#enemy.look_at(Demon.demon.global_position)
	enemy.direction = enemy.global_position.direction_to(Demon.demon.global_position)
	
	Layers.BATTLE_LAYER.add_child(enemy)
	enemy.icon.texture = enemy.enemy_data.texture
	pass


func _on_timer_timeout() -> void:
	spawn_mobs()
	spawn_mobs()
	spawn_mobs()
	spawn_mobs()
	
