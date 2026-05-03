extends Area2D
class_name FireBallExplosion

static var _scene:PackedScene = preload("res://scenes/bullets/explosions/FireBallExplosion.tscn")
static var _pool:Array[FireBallExplosion] = []


static func instantiate(p_pos:Vector2):
	var explos:FireBallExplosion
	if _pool.is_empty():
		explos = _scene.instantiate()
	else:
		explos = _pool.pop_back()
	
	
	explos.global_position = p_pos
	Layers.BATTLE_LAYER.add_child(explos)
	explos.spawn()
	pass


@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var explosion_parts: CPUParticles2D = %ExplosionParts


func spawn():
	explosion_parts.initial_velocity_max = UpgradeStorage.fireball_explosion_radius
	explosion_parts.initial_velocity_min = UpgradeStorage.fireball_explosion_radius*0.9
	explosion_parts.restart()
	collision_shape_2d.shape.radius = UpgradeStorage.fireball_explosion_radius
	collision_shape_2d.scale = Vector2.ZERO
	var tween = create_tween()
	tween.tween_property(collision_shape_2d,'scale', Vector2.ONE,0.5)
	tween.chain().tween_callback(destroy)
	
	pass


func destroy():
	Layers.BATTLE_LAYER.remove_child(self)
	_pool.append(self)
	
	pass


func _on_area_entered(area: Area2D) -> void:
	if area:
		area._take_damage(UpgradeStorage.firebolt_damage)
	pass # Replace with function body.
