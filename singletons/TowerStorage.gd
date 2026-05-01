extends Node


@export var laser_demon:TowerData
@export var plasma_demon:TowerData
@export var railgun_demon:TowerData


func upgrade_laser_demon_rapidness():
	laser_demon.rapidness *=0.9
	
	pass


func upgrade_laser_demon_damage():
	laser_demon.damage +=1
	pass
