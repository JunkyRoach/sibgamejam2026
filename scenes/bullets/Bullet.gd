extends Area2D
class_name Bullet


var direction:Vector2
@export var speed:int
@export var damage:int




func _process(delta: float) -> void:
	self.global_position += direction *speed * delta
	
