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

@export var upgrade_texture_1:Texture
@export var upgrade_texture_2:Texture
@export var upgrade_texture_3:Texture
@export var upgrade_texture_4:Texture
@export var upgrade_texture_5:Texture
@export var upgrade_texture_6:Texture



@export var firebolt_scene:PackedScene




@onready var timer: Timer = $Timer

@onready var srt: Node2D = $SRT
@onready var icon: Sprite2D = %Icon

@onready var level_up_parts: CPUParticles2D = %LevelUpParts
@onready var flame_thrower: FlameThrower = %FlameThrower
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var icon_srt: Node2D = $IconSRT


var direction:Vector2
var current_target:Enemy

var current_hp:int

func _ready() -> void:
	demon = self
	current_hp = UpgradeStorage.max_hp
	timer.start(UpgradeStorage.firebolt_fire_rate)
	GameController.level_up_signal.connect(_on_level_up)

		
	pass


func _process(delta: float) -> void:
	icon.modulate = lerp(icon.modulate, Color.WHITE, 0.05)
	if current_target!=null:
		srt.look_at(current_target.global_position)
	
	current_target = EnemyManager.get_closest_enemy(srt.global_position)

	_movement_process(delta)

func _movement_process(delta:float) -> void:
	direction = self.global_position.direction_to(get_global_mouse_position())
	self.global_position+= direction * delta * UpgradeStorage.demon_speed
	
	pass


func attack():
	if current_target==null:
		return
	var bullet:Bullet = firebolt_scene.instantiate()
	Layers.BATTLE_LAYER.add_child(bullet)
	bullet.damage = UpgradeStorage.firebolt_damage
	bullet.global_position =%Marker2D.global_position
	bullet.rotation = srt.global_rotation
	bullet.direction = Vector2.from_angle(bullet.rotation)
	pass

func take_damage(p_damage:int):
	
	icon.modulate = Color.RED
	current_hp -= p_damage
	progress_bar.max_value = UpgradeStorage.max_hp
	progress_bar.value = current_hp
	if current_hp <= 0:
		dead()
	pass

func dead():
	GameController.game_over()
	#ScreenManager.show_main_menu()
	pass

func _on_level_up():
	flame_thrower.set_process(true)
	level_up_parts.restart()
	if GameController.level == 6:
		icon.texture = upgrade_texture_2
		icon_srt.scale = Vector2(1.1, 1.1)
	if GameController.level == 12:
		icon.texture = upgrade_texture_3
		icon_srt.scale = Vector2(1.2, 1.2)
	if GameController.level == 18:
		icon.texture = upgrade_texture_4
		icon_srt.scale = Vector2(1.3, 1.3)
	if GameController.level == 24:
		icon_srt.scale = Vector2(1.4, 1.5)
		icon.texture = upgrade_texture_5
	if GameController.level == 66:
		icon_srt.scale = Vector2(1.5, 1.5)
		flame_thrower.set_process(true)
		icon.texture = upgrade_texture_6

	pass

func _on_timer_timeout() -> void:
	attack()
	timer.start(UpgradeStorage.firebolt_fire_rate)


func _on_second_timer_timeout() -> void:
	current_hp += UpgradeStorage.hp_regeneration
	current_hp = min(current_hp, UpgradeStorage.max_hp)
	progress_bar.max_value = UpgradeStorage.max_hp
	progress_bar.value = current_hp
	pass # Replace with function body.
