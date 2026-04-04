extends Area2D
class_name Bullet


var direction:Vector2
var speed:int
var damage:int

@export var bullet_data:BulletData


func update_data(p_bullet_data:BulletData):
	bullet_data = p_bullet_data
	speed = bullet_data.speed
	damage = bullet_data.damage
	pass

func _on_area_entered(area: Area2D) -> void:
	$Line2D.visible = false
	speed = 0
	$CPUParticles2D.restart()
	await $CPUParticles2D.finished
	queue_free()
	pass # Replace with function body.


func _process(delta: float) -> void:
	self.global_position += direction *speed * delta
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
