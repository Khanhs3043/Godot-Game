extends CharacterBody2D

@export var health = 100
@export var SPEED = 300.0
@onready var sprite : AnimatedSprite2D = $mobsprite
var chase : bool = false
var player 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal health_changed
func _ready():
	$healthbar2.initialize("health_changed", health)

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
	elif !chase && health > 0:
		get_node("mobsprite").play("idle")
		velocity.x = 0
	move_and_slide()

func _process(delta):
	if health <= 0:
		death()

func death():
	velocity.x = 0
	chase = false
	get_node("mobsprite").play("death")
	await get_node("mobsprite").animation_finished
	self.queue_free()

func _on_detectionzone_body_entered(body):
	chase = true

func _on_detectionzone_body_exited(body):
	chase = false

func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	health -= 10
	emit_signal("health_changed", health)
