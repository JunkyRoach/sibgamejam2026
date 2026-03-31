extends Resource
class_name TowerData

@export var title:String
@export var tower_texture: Texture
@export var bullet:PackedScene
@export var rapidness:float
@export var damage:int
@export var radius:float

@export var upgrade_cost:int

@export var next_level_data:TowerData
