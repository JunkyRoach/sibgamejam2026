extends Resource
class_name TowerData

@export var title:String
@export var demon_texture: Texture
@export var bullet_scene:PackedScene
@export var rapidness:float
@export var damage:int
@export var radius:float

@export var base_cost:int
@export var upgrade_cost:int

@export var next_level_data:TowerData
