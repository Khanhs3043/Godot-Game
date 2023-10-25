extends Area2D
class_name hitbox

@export var damage = 10

@onready var collision_shape = $CollisionShape2D

func _init() -> void:
	collision_mask = 0
	collision_layer = 2
	


