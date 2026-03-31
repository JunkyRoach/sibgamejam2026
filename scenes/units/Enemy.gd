extends PathFollow2D
class_name Enemy
var enemy_data:EnemyData


static func instantiate(p_enemy_data:EnemyData)->Enemy:
	var enemy:Enemy = preload("res://scenes/units/Enemy.tscn").instantiate()
	enemy.update_data(p_enemy_data)
	return enemy


@onready var area_2d: Area2D = %Area2D
@onready var destroy_parts: CPUParticles2D = %DestroyParts

var speed:float
var hp:int

var is_dead:bool


func update_data(p_enemy_data:EnemyData):
	GameController.mission_lose.connect(destroy)
	enemy_data = p_enemy_data
	hp = enemy_data.max_hp
	speed = enemy_data.speed
	EnemyManager.enemies_list.append(self)


func reach_path_end():
	GameController.enemy_reach_end(enemy_data)
	destroy()


func destroy():
	EnemyManager.enemies_list.erase(self)
	self.queue_free()
	
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bullet:
		_take_damage(area.damage)
	pass # Replace with function body.

func _take_damage(p_damage:int):
	hp-=p_damage
	if hp<=0:
		_dead()
	pass

func _dead():
	if is_dead:
		return
	is_dead = true
	area_2d.set_deferred('monitorable', false)
	speed = 0
	EnemyManager.enemies_list.erase(self)
	destroy_parts.restart()
	await destroy_parts.finished
	destroy()
	pass
