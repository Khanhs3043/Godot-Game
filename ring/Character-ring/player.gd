extends CharacterBody2D

class_name Player
@export var jumppad = -3000
@export var speed : float = 1000
@export var knockback_up = -1000
@export var knockback = 2500
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animated_sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var timer : Timer = $hitbox/Timer
var being_hit : bool = false
var knockback_direction
var enemy 
var solution_collected : bool = false
var venom_colleted : bool = false
var leaf_collected : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
signal facing_direction_changed(facing_right : bool)
func _ready():
	animation_tree.active = true
func _physics_process(delta):
	#trong luc
	if not is_on_floor():
		velocity.y += gravity * delta
#gan phim di chuyen
	direction = Input.get_vector("left", "right", "up", "down")
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if being_hit:
		enemy = get_node("../mob")
		knockback_direction = (-(enemy.position - self.position)).normalized()
		get_hit()
	if Global.player_health <= 0:
		get_tree().change_scene_to_file("res://ring/Levels-ring/deathscene.tscn")
	move_and_slide()
	update_animation()
	update_facing_direction()

func get_hit():
	self.velocity.x = knockback_direction.x * knockback
	self.velocity.y = knockback_up

#cap nhat trang thai quya trai phai
func update_animation():
	animation_tree.set("parameters/move/blend_position",direction.x)

#dieuf chinh sprite nhan vat quay mat trai phai
func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
		emit_signal("facing_direction_changed", animated_sprite.flip_h)
	elif direction.x < 0:
		animated_sprite.flip_h = true
		emit_signal("facing_direction_changed", !animated_sprite.flip_h)

#dieu kien qua man
func _on_area_2d_area_shape_entered():
		if leaf_collected && venom_colleted && solution_collected:
			Global.ring = true
			get_tree().change_scene_to_file("res://ring/Levels-ring/win_scene.tscn")
			#next level
		else:
			get_tree().change_scene_to_file("res://ring/Levels-ring/deathscene.tscn")

#nhat duoc hoa
func _on_leaf_tree_exited():
	leaf_collected = true
#nhat duoc lo doc
func _on_venom_tree_exited():
	venom_colleted = true
#nhat duoc dung dich
func _on_solution_tree_exited():
	solution_collected = true


#dich chuyen ve sau khi nhat duoc hoa
func _on_portaldetection_area_entered(area):
	if area.is_in_group("portal"):
		position.x = -5240
		position.y = -1152
	if area.is_in_group("portal2"):
		position.x = 4800
		position.y = -3100

func _on_hitbox_body_shape_entered():
	Global.player_health -= 1
	being_hit = true
	timer.start()

func _on_timer_timeout():
	being_hit = false

func _on_jumppad_body_entered():
	velocity.y = jumppad 
