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

func get_dangerous_enemy_in_range(p_position:Vector2, p_range:float)->Enemy:
	
	for enemy:Enemy in enemies_list:
		if enemy.global_position.distance_to(p_position) <= p_range:
			return enemy
	
	
	return null
