extends CharacterBody2D
@export var speed = 6000
var dir
func _process(delta):
	# Lấy vị trí của chuột
	dir = Input.get_vector("left","right","up","down") 
	var mouse_position = get_global_mouse_position()
	if Input.is_action_pressed("left"):
		rotation_degrees = -90
	elif Input.is_action_pressed("right"):
		rotation_degrees = 90
	elif Input.is_action_pressed("up"):
		rotation_degrees = 0
	elif Input.is_action_pressed("down"):
		rotation_degrees = 180
	else: rotation_degrees = 0
	velocity = dir * speed * delta
	move_and_slide()
