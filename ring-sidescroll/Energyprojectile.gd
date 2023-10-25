extends Node2D

var speed = 300  # Adjust the speed as needed

func _process(delta):
	var velocity = Vector2(speed, 0).rotated(rotation) * delta
	translate(velocity)
