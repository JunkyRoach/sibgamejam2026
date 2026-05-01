extends Node2D
class_name Demon

static var _scene:PackedScene = preload("res://scenes/demons/Demon.tscn")

static func spawn_demon(p_pos:Vector2, p_demon_data:TowerData):
	var _demon = _scene.instantiate()
	_demon.global_position = p_pos
	_demon.demon_data = p_demon_data
	BattleScreen.screen.add_child(_demon)
	
	pass

static var demon:Demon

@export var firebolt_scene:PackedScene

@export var attack_range:float = 300.0
@export var reload_time:float = .1
@export var speed:float = 100

@onready var timer: Timer = $Timer

@onready var srt: Node2D = $SRT

var direction:Vector2
var current_target:Enemy


func _ready() -> void:
	demon = self
	
	timer.wait_time = reload_time
	timer.start()
	attack_range = attack_range
		
	pass


func _process(delta: float) -> void:
	
	if current_target!=null:
		srt.look_at(current_target.global_position)
	
	current_target = EnemyManager.get_closest_enemy(srt.global_position)

	_movement_process(delta)

func _movement_process(delta:float) -> void:
	direction = self.global_position.direction_to(get_global_mouse_position())
	self.global_position+= direction * delta * speed
	
	pass


func attack():
	if current_target==null:
		return
	var bullet:Bullet = firebolt_scene.instantiate()
	Layers.BATTLE_LAYER.add_child(bullet)
	bullet.global_position =%Marker2D.global_position
	bullet.rotation = srt.global_rotation
	bullet.direction = Vector2.from_angle(bullet.rotation)
	pass


func _on_timer_timeout() -> void:
	attack()
	pass # Replace with function body.
