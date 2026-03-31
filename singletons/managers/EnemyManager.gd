extends Node

var enemies_list:Array[Enemy] = []




func _process(delta: float) -> void:
	for enemy:Enemy in enemies_list:
		enemy.progress += enemy.speed * delta
		if enemy.progress_ratio >=1.0:
			enemy.reach_path_end()


func _on_timer_timeout() -> void:
	enemies_list.sort_custom(func(a, b): return a.progress_ratio > b.progress_ratio)



func get_dangerous_enemy_in_range(p_position:Vector2, p_range:float)->Enemy:
	
	for enemy:Enemy in enemies_list:
		if enemy.global_position.distance_to(p_position) <= p_range:
			return enemy
	
	
	return null
