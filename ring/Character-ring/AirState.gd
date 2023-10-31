extends State

class_name AirState
@export var double_jump_velocity : float = -100
@export var landing_state : State 
@export var db_jump_animation : String = "db_jump"
@export var landing_anim : String = "landing"
@export var fall_anim : String = "fall"
var has_double_jumped : bool = false
func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state
		
#db_jump gan phim
func state_input(event : InputEvent):
	if (event.is_action_pressed("jump") && !has_double_jumped):#chi nhay db dc 1 lan tren khong
		double_jump()

func on_exit():
	if(next_state == landing_state):
		has_double_jumped = false
		playback.travel(landing_anim)


func double_jump():
	character.velocity.y = double_jump_velocity
	has_double_jumped = true
	playback.travel(db_jump_animation)
#animation roi
func _physics_process(delta):
	if (!character.is_on_floor()) && (character.velocity.y > 0):
		playback.travel(fall_anim)
