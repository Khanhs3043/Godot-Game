extends CharacterBody2D
@export var speed: int = 4000
var dir
func _process(delta):
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



func _on_take_area_entered(area):
	if area.has_method("is_bubble"):
		Global.bubbleamount +=1
		area.queue_free()
		$"../ui".update_bubbleAmount()


func _on_reach_area_entered(area):
	pass
			
