extends Area2D

@export var hp_amount:=100

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		_take_damage(area.damage)

func _take_damage(p_damage:int):
	hp_amount-=p_damage
	if hp_amount<=0:
		queue_free()
	pass
