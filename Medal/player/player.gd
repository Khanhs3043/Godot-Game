extends CharacterBody2D
@export var speed = 6000
var dir
var energy = 100
var breath = 100
var injured = false
signal avada(direction)
var on_the_ground = false
var hand
var locket_in_hand = false
var dead = false

func _process(delta):
	if breath <=0 or energy <=0 :
		dead = true
	hand = $hand.global_position
	if breath > 100:
		breath = 100
	if not on_the_ground:
		breath -= 2*delta
		dir = Input.get_vector("left","right","up","down") 
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
	if on_the_ground:
		breath += 10
		const movespeed = 200
		const jump_velocity = -400
		var gravity = 1000
		if not is_on_floor():
			velocity.y += gravity*delta
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_velocity
		var movedir = Input.get_axis("ui_left","ui_right")
		if movedir:
			velocity.x = movedir*movespeed
		else:
			velocity.x = move_toward(velocity.x,0,movespeed)
		move_and_slide()
	if Input.is_action_just_pressed("leftclick"):
		var mouse_position = get_global_mouse_position()
		var direction = Vector2(mouse_position - global_position).normalized()
		avada.emit(direction)
	
	if injured:
		var tween = get_tree().create_tween()
		tween.tween_property($".","modulate",Color(0.8, 0, 0),0.2)
		tween.tween_property($".","modulate",Color(1, 1, 1),0.2)
		energy -= 0.3
	


func _on_body_body_entered(body):
	if body.has_method("isbone"):
		injured = true
		$"../locket".in_hand = false
	if body.name =="locket":
		body.in_hand = true
		body.global_position = global_position


func _on_body_body_exited(body):
	if body.has_method("isbone"):
		injured = false


func _on_body_area_entered(area):
	if area.has_method("is_breath"):
		area.queue_free()
		breath += 10
	if area.has_method("is_energy"):
		area.queue_free()
		energy += 10
