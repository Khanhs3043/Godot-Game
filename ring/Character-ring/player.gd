extends CharacterBody2D

class_name Player
@export var speed : float = 200.0
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animated_sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree

var solution_collected : bool = false
var venom_colleted : bool = false
var leaf_collected : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
signal facing_direction_changed(facing_right : bool)

func _ready():
	animation_tree.active = true

#
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

	move_and_slide()
	update_animation()
	update_facing_direction()


	
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
func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
		if leaf_collected && venom_colleted && solution_collected:
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

