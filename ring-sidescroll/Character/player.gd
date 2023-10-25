extends CharacterBody2D

class_name Player

@export var speed : float = 200.0
@export var dash_speed : float = 1000.0
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animated_sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facing_direction_changed(facing_right : bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	animation_tree.set("parameters/move/blend_position",direction.x)

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
		emit_signal("facing_direction_changed", animated_sprite.flip_h)
	elif direction.x < 0:
		animated_sprite.flip_h = true
		emit_signal("facing_direction_changed", !animated_sprite.flip_h)



