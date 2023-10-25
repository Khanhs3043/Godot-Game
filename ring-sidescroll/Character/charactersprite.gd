extends Sprite2D

@onready var projectile_scene = preload("res://fire.tscn")
func _process(delta):
	if Input.is_action_just_pressed("atk"):
		var direction = 1
		if flip_h == true :
			direction = -1 
		var fireball = projectile_scene.instantiate()
		fireball.set_direction(direction)
		fireball.position = $firepoint.global_position
		get_parent().get_parent().add_child(fireball)
