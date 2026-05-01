extends Node2D
class_name FlameThrower



var current_target:Enemy
var damage:=100



func _process(delta: float) -> void:
	
	current_target = EnemyManager.get_closest_enemy(self.global_position)
	if current_target!=null:
		var target_angle = global_position.angle_to_point(current_target.global_position)
		self.global_rotation = lerp_angle(self.global_rotation, target_angle, 0.05)
		

	pass


func _on_fire_thrower_area_area_entered(area: Area2D) -> void:
	if current_target != null:
		area._take_damage(damage)
	
	pass # Replace with function body.
