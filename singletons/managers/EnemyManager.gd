extends Node

var enemies_list:Array[Enemy] = []

func _process(delta: float) -> void:
	for enemy:Enemy in enemies_list:
		enemy.global_position += enemy.direction * enemy.speed * delta 
		if enemy.global_position.distance_to(Tower.tower.global_position)<=30:
			enemy.destroy()


func _on_timer_timeout() -> void:
	print()
	#enemies_list.sort_custom(func(a, b): return a.progress_ratio > b.progress_ratio)


func get_random_enemy()->Enemy:
	if enemies_list.is_empty():
		return null
	else:
		return enemies_list.pick_random()

func get_closest_enemy(p_pos:Vector2)->Enemy:
	var closest_enemy:Enemy
	if !enemies_list.is_empty():
		closest_enemy = enemies_list[0]
		for enemy:Enemy in enemies_list:
			if enemy.global_position.distance_squared_to(p_pos) <= closest_enemy.global_position.distance_squared_to(p_pos):
				closest_enemy = enemy	
	
	return closest_enemy


func get_dangerous_enemy_in_range(p_position:Vector2, p_range:float)->Enemy:
	
	for enemy:Enemy in enemies_list:
		if enemy.global_position.distance_to(p_position) <= p_range:
			return enemy
	
	
	return null
