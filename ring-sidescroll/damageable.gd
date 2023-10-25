extends Node

class_name damageable

var character : CharacterBody2D
signal  on_hit(node : Node, damage_taken : int, knockback_direction : Vector2)

@export var knockback : float = 1
@export var health : float = 20

func hit(damage : int, knockback_direction : Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
		
@export var death_animation_name : String = "death"

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == death_animation_name):
		get_parent().queue_free()
