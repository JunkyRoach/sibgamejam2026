extends Sprite2D
class_name Soul

static var _pool:Array[Soul] = []

static var soul_scene:PackedScene = preload("res://scenes/pickables/SoulScene.tscn")

static func instantiate(p_pos:Vector2):
	
	var soul:Soul
	if _pool.is_empty():
		soul = soul_scene.instantiate()
	else:
		soul = _pool.pop_back()
		
	soul.global_position = p_pos	
	Layers.BATTLE_LAYER.add_child(soul)
	
	pass


func _process(delta: float) -> void:
	if self.global_position.distance_to(Demon.demon.global_position) <30:
		destroy()
	elif self.global_position.distance_to(Demon.demon.global_position) <UpgradeStorage.souls_magnit:
		self.global_position = lerp(self.global_position,Demon.demon.global_position, 0.1 )
	pass



func destroy():
	GameController.soul_added()
	self.get_parent().remove_child(self)
	_pool.append(self)
	
	pass
