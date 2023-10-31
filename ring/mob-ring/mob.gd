extends CharacterBody2D

@export var health = 50
@export var SPEED = 300.0
@onready var sprite : AnimatedSprite2D = $mobsprite
var chase : bool = false
var player 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	velocity.y += gravity * delta
	player = get_node("../Player")
	var direction = (player.position - self.position).normalized()
	if chase :
			get_node("mobsprite").play("run")
			velocity.x = direction.x * SPEED
			if direction.x > 0 :
				sprite.flip_h = true
			elif direction.x < 0 :
				sprite.flip_h = false
	else:
		get_node("mobsprite").play("idle")
		velocity.x = 0
	move_and_slide()




func _on_detectionzone_body_entered(body):
	chase = true


func _on_detectionzone_body_exited(body):
	chase = false


