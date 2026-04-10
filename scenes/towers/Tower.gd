extends Node2D
class_name Tower

static var _scene:PackedScene = preload("res://scenes/towers/Tower.tscn")

static func spawn_tower(p_pos:Vector2, p_tower_data:TowerData):
	var _tower = _scene.instantiate()
	_tower.global_position = p_pos
	_tower.tower_data = p_tower_data
	BattleScreen.screen.add_child(_tower)
	
	pass

static var tower:Tower

@export var tower_data:TowerData

@export var attack_range:float = 300.0
@export var reload_time:float = .1

@onready var timer: Timer = $Timer

@onready var srt: Node2D = $SRT
@onready var sprite_2d: Sprite2D = $SRT/Sprite2D



var current_target:Enemy


func _ready() -> void:
	tower = self
	if tower_data:
		timer.wait_time = tower_data.rapidness
		timer.start()
		attack_range = tower_data.radius
		sprite_2d.texture = tower_data.tower_texture
	pass


	

#func _draw() -> void:
	#draw_circle(Vector2.ZERO, attack_range,Color(0,1,0,.1), false, 2, true)
	##if current_target != null:
		##draw_line(Vector2.ZERO, to_local(current_target.global_position), Color.RED, 2)


func _process(delta: float) -> void:
	
	#if current_target!=null:
		##srt.global_rotation = lerp_angle(srt.global_rotation, get_angle_to(current_target.global_position), 0.05)
		#srt.look_at(current_target.global_position)
	
	current_target = EnemyManager.get_closest_enemy(srt.global_position)
	#queue_redraw()

func attack():
	if current_target==null:
		return
	var bullet:Bullet = tower_data.bullet_scene.instantiate()
	Layers.BATTLE_LAYER.add_child(bullet)
	bullet.global_position =%Marker2D.global_position
	bullet.rotation = srt.global_rotation
	bullet.direction = Vector2.from_angle(bullet.rotation)
	
	
	print('Tower Attack')
	pass


func _on_timer_timeout() -> void:
	attack()
	pass # Replace with function body.
