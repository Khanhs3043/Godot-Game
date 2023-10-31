extends Node

class_name CharacterStateMachine

@export var character : CharacterBody2D 
@export var animation_tree : AnimationTree
@export var current_state : State
var states : Array[State]

#doc trang thai nhan vat va nap hoat anh
func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
			child.playback = animation_tree["parameters/playback"]
			child.character = character
			child.connect("interupt_state", on_interupt)


#quet trang thai nv
func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)

#thay doi tung trang thai co the di chuyen hay khong
func check_if_can_move():
	return current_state.can_move

#sau quet thi thay doi trang thai 
func switch_states(new_state : State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	current_state.on_enter()

#doi trang thai neu trang thai cu chua ket thuc
func on_interupt(new_state):
	switch_states(new_state)

#doc nut trong cac trang thai
func _input(event : InputEvent):
	current_state.state_input(event)
