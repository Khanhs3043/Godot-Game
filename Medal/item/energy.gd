extends Area2D
@export var speed = 30
func is_energy():
	return true
func _process(delta):
	global_position.y -= speed*delta
