extends Node2D

@export var bullet_scene:PackedScene
@export var attack_range:float = 300.0
@export var reload_time:float = .1

@onready var timer: Timer = $Timer

@onready var srt: Node2D = $SRT
@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite


var current_target:Enemy

func _ready() -> void:
	timer.wait_time = reload_time
	timer.start()
	pass


func _draw() -> void:
	draw_circle(Vector2.ZERO, attack_range,Color(0,1,0,.1), false, 2, true)
	#if current_target != null:
		#draw_line(Vector2.ZERO, to_local(current_target.global_position), Color.RED, 2)


func _process(delta: float) -> void:
	current_target = EnemyManager.get_dangerous_enemy_in_range(self.global_position, attack_range)
	if current_target!=null:
		animated_sprite.play("shoot")
		%ShotVFX.visible = true
		srt.look_at(current_target.global_position)
	else:
		animated_sprite.play("default")
		%ShotVFX.visible = false
	queue_redraw()

func attack():
	if current_target==null:
		return
	var bullet:Bullet = bullet_scene.instantiate()
	Layers.BATTLE_LAYER.add_child(bullet)
	if randf()>0.5:
		bullet.global_position =%Marker2D.global_position
	else:
		bullet.global_position =%Marker2D2.global_position
	bullet.rotation = srt.rotation
	bullet.direction = Vector2.from_angle(bullet.rotation)
	
	
	print('Tower Attack')
	pass


func _on_timer_timeout() -> void:
	attack()
	pass # Replace with function body.
