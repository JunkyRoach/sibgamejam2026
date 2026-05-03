extends Node


@export var perk_list:Array[Resource]
const DEMON_SPEED_UPGRADE_STEP:=10
const SOULS_MAGNIT_UPGRADE_STEP:=10
const FIREBOLT_DAMAGE_UPGRADE_STEP:=5
const FIREBOLT_RADIUS_UPGRADE_STEP:=10

var demon_speed:=100
var souls_magnit:=150
var firebolt_damage:=1
var firebolt_fire_rate:=1
var fireball_explosion_radius:=50

var max_hp:= 666
var hp_regeneration:=1

func reset_stats():
	max_hp = 666
	hp_regeneration = 1
	demon_speed = 100
	souls_magnit = 100
	firebolt_damage = 1
	firebolt_damage = 2
	fireball_explosion_radius = 50
	
	pass


func demon_speed_upgrade():
	demon_speed+=DEMON_SPEED_UPGRADE_STEP
	pass

func souls_magnit_upgrade():
	souls_magnit+= SOULS_MAGNIT_UPGRADE_STEP
	

func firebolt_damage_upgrade():
	firebolt_damage+=FIREBOLT_DAMAGE_UPGRADE_STEP
	
	
	
func firebolt_fire_rate_upgrade():
	firebolt_fire_rate*=0.9

	
func fireball_radius_upgrade():
	fireball_explosion_radius+= FIREBOLT_RADIUS_UPGRADE_STEP
	
