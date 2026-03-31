extends Area2D
class_name Bullet


var speed:=800
var direction:Vector2
var damage:=10

func _on_area_entered(area: Area2D) -> void:
	$Line2D.visible = false
	speed = 0
	$CPUParticles2D.restart()
	await $CPUParticles2D.finished
	queue_free()
	pass # Replace with function body.


func _process(delta: float) -> void:
	self.global_position += direction *speed * delta
	
