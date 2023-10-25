extends State

class_name GroundState

@export var jump_velocity : float = -150.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack : State
@export var atk_animation : String = "atk1"
@export var dash_velocity : float = 1000
@export var dash_state : State
@export var dash_animation : String = "dash"
func state_input(event : InputEvent):
	if (event.is_action_pressed("jump")):
		jump()
	if (event.is_action_pressed("atk")):
		atk()
	#if (event.is_action_pressed("dash")):
		#dash()


#func dash():
	#character.velocity.x += dash_velocity
	#next_state = dash_state
	#playback.travel(dash_animation)
	
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)


func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state
func atk():
	next_state = attack
	playback.travel(atk_animation)
	
	
	
