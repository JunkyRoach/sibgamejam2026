extends Node2D


@export var tower:Tower
@export var radius:=100

var current_target:Enemy
@onready var remote_transform_2d: RemoteTransform2D = $RemoteTransform2D

func _ready() -> void:
	#remote_transform_2d.position.x = radius
	
	pass

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius,Color(0,1,0,.1), false, 2, true)
	if current_target !=null:
		draw_line(Vector2.ZERO,to_local(current_target.global_position), Color.GREEN, 2)
	

func _process(delta: float) -> void:

	self.global_rotation+=delta*radius/100
	#if current_target!=null and !current_target.is_dead:
		#self.global_rotation_degrees = lerpf(self.global_rotation_degrees,rad_to_deg(self.global_position.direction_to(current_target.global_position).angle()), 0.02)
		
		#self.look_at(current_target.global_position)
		
		
	if current_target == null or current_target.is_dead:
		current_target = EnemyManager.get_random_enemy()	
	#current_target = EnemyManager.get_closest_enemy(self.global_position)
	queue_redraw()
