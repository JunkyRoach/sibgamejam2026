extends Node


@export var laser_tower:TowerData
@export var plasma_tower:TowerData
@export var railgun_tower:TowerData


func upgrade_laser_tower_rapidness():
	laser_tower.rapidness *=0.9
	
	pass


func upgrade_laser_tower_damage():
	laser_tower.damage +=1
	pass
