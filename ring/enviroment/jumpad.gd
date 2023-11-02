extends CharacterBody2D
@onready var player_on_pad : bool = false
func _process(delta):
	if !player_on_pad:
		get_node("AnimatedSprite2D").play("idle")

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	player_on_pad = true
	get_node("AnimatedSprite2D").play("jump")
	await get_node("AnimatedSprite2D").animation_finished
	self.player_on_pad = false



