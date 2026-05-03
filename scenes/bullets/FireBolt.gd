extends Bullet
class_name FireBolt

@onready var sprite_2d: Sprite2D = $Sprite2D



func _on_area_entered(area: Area2D) -> void:
	sprite_2d.visible = false
	speed = 0
	FireBallExplosion.instantiate(self.global_position)
	queue_free()
	pass # Replace with function body.



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
