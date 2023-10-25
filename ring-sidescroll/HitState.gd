extends State

class_name HitState
@export var Damageable : damageable
@export var death_state : State
@export var knockback : float = 100
@export var return_state : State
@onready var timer : Timer = $Timer
var death_animation : String = "death"

func on_enter():
	
	timer.start()
func on_exit():
	character.velocity = Vector2.ZERO

func _ready():
	Damageable.connect("on_hit",on_damageable_hit)
	
func on_damageable_hit(node : Node, damageable_amount : int, knockback_direction : Vector2):
	if(Damageable.health > 0):
		character.velocity = knockback * knockback_direction
		emit_signal("interupt_state", self)
	else:
		emit_signal("interupt_state", death_state)
		playback.travel(death_animation)


func _on_timer_timeout():
	next_state = return_state
