extends CharacterBody2D
@export var speed: int = 5000
var dir
var is_invisible = false
@onready var invisible_time = $invisibletime

func _ready():
	invisible_time.wait_time = 10
func _process(delta):
	#print(is_invisible)
	dir = Input.get_vector("left","right","up","down")
	velocity = dir.normalized()*delta*speed
	move_and_slide()
	if velocity.length()>0:
		$ani.play("walk")
	else: $ani.play("idle")
	if Input.is_action_pressed("right"):
		$ani.scale.x = 1
	if Input.is_action_pressed("left"):
		$ani.scale.x = -1
	if Input.is_action_just_pressed("invisible") and Global.bubbleamount >0:
		$"../ui".countdown()
		is_invisible = true
		activate_invisibility()
		Global.bubbleamount -=1
		$"../ui".update_bubbleAmount()

func activate_invisibility():
	if is_invisible:
		$invisibletime.start()
		$".".modulate = Color(1,1,1,0.4)

func _on_take_area_entered(area):
	if area.has_method("is_bubble"):
		Global.bubbleamount +=1
		area.queue_free()
		$"../ui".update_bubbleAmount()

func _on_reach_area_entered(area):
	pass
			


func _on_invisibletime_timeout():
	is_invisible = false
	$".".modulate = Color(1,1,1,1)
