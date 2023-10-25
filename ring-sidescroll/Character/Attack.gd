extends State
@export var return_state : State
@export var return_anim_node :String = "move" 
@export var atk1_name : String = "atk1"
func state_input(event : InputEvent):
	pass

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == atk1_name):
		next_state = return_state
		playback.travel(return_anim_node)
