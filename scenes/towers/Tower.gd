extends Node2D
class_name Tower

static var _scene:PackedScene = preload("res://scenes/towers/Tower.tscn")

static func spawn_tower(p_pos:Vector2):
	var _tower = _scene.instantiate()
	_tower.global_position = p_pos
	BattleScreen.screen.add_child(_tower)
	
	pass

static var tower:Tower

@export var bullet_scene:PackedScene
@export var attack_range:float = 300.0
@export var reload_time:float = .1

@onready var timer: Timer = $Timer

@onready var srt: Node2D = $SRT



var current_target:Enemy


func _ready() -> void:
	timer.wait_time = reload_time
	tower = self
	timer.start()
	pass


func _draw() -> void:
	draw_circle(Vector2.ZERO, attack_range,Color(0,1,0,.1), false, 2, true)
	#if current_target != null:
		#draw_line(Vector2.ZERO, to_local(current_target.global_position), Color.RED, 2)


func _process(delta: float) -> void:
	
	if current_target!=null:
		srt.rotation = lerp_angle(srt.rotation, get_angle_to(current_target.global_position), 0.05)
		#srt.look_at(current_target.global_position)
	else:
		current_target = EnemyManager.get_random_enemy()
	queue_redraw()

func attack():
	if current_target==null:
		return
	var bullet:Bullet = bullet_scene.instantiate()
	bullet.update_data(preload("res://data/bullets/laser_base.tres"))
	Layers.BATTLE_LAYER.add_child(bullet)
	bullet.global_position =%Marker2D.global_position
	bullet.rotation = srt.rotation
	bullet.direction = Vector2.from_angle(bullet.rotation)
	
	
	print('Tower Attack')
	pass


func _on_timer_timeout() -> void:
	attack()
	pass # Replace with function body.
