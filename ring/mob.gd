extends CharacterBody2D
var speed = 75
var grav = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var player
func _ready():
	get_node("mobsprite").play("idle")
func _physics_process(delta):
	#gravity
	velocity.y += grav * delta
	#get player position
	if chase == true:
		if get_node("mobsprite").animation != "death":
			get_node("mobsprite").play("movement")
			player = get_node("res://ring/Character-ring/player.tscn")
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("mobsprite").flip_h = true
			else:
				get_node("mobsprite").flip_h = false
			velocity.x = direction.x * speed
	else:
		if get_node("mobsprite").animation != "death":
			get_node("mobsprite").play("idle")
			velocity.x = 0
	move_and_slide()
	
func death():
	self.queue_free()
	
 
