extends StaticBody2D

var is_open = false
var can_touch = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_open:
		$AnimatedSprite2D.frame = 1
	else: 
		$AnimatedSprite2D.frame = 0



func _on_area_2d_mouse_entered():
	#$AnimatedSprite2D.frame = 1
	pass

func _on_area_2d_mouse_exited():
	#$AnimatedSprite2D.frame = 0
	pass


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if can_touch:
			if is_open:
				is_open = false
			else:
				is_open = true


func _on_canopen_body_entered(body):
	if body.name == "player":
		can_touch= true
	


func _on_canopen_body_exited(body):
	if body.name == "player":
		can_touch= false
