extends Area2D
class_name Enemy
var enemy_data:EnemyData


static func instantiate(p_enemy_data:EnemyData)->Enemy:
	var enemy:Enemy = preload("res://scenes/units/Enemy.tscn").instantiate()
	enemy.update_data(p_enemy_data)
	return enemy



@onready var icon: Sprite2D = $Icon

@onready var destroy_parts: CPUParticles2D = %DestroyParts
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var animation_player: AnimationPlayer = %AnimationPlayer


var speed:float
var hp:int

var is_dead:bool
var direction:Vector2


func update_data(p_enemy_data:EnemyData):
	
	GameController.mission_lose.connect(destroy)
	enemy_data = p_enemy_data
	hp = enemy_data.max_hp
	speed = enemy_data.speed
	EnemyManager.enemies_list.append(self)
	 
	


func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		_take_damage(area.damage)
	
		
	
func _take_damage(p_damage:int):
	hp-=p_damage
	progress_bar.max_value = enemy_data.max_hp
	progress_bar.value = hp
	progress_bar.visible = true
	if hp<=0:
		progress_bar.visible = false
		_dead()
	pass

func _dead():
	if is_dead:
		return
	
	is_dead = true
	self.set_deferred('monitorable', false)
	speed = 0
	
	icon.visible = false
	EnemyManager.enemies_list.erase(self)
	Soul.instantiate(self.global_position)
	destroy_parts.restart()
	await destroy_parts.finished
	destroy()
	pass


func attack():
	if animation_player.current_animation == 'attack' or  animation_player.current_animation == 'attack_right':
		return
	if icon.flip_h:
		animation_player.play("attack_right")
	else:
		animation_player.play("attack")
	await animation_player.animation_finished
	animation_player.play("idle")
	pass

func deal_damage():
	Demon.demon.take_damage(enemy_data.damage)
	pass

func destroy():
	EnemyManager.enemies_list.erase(self)
	self.queue_free()
	pass
