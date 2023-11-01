extends Area2D
var collected = false
func is_key():
	return true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func follow_mouse():
	global_position = get_global_mouse_position()
func _process(_delta):
	if collected:
		follow_mouse()


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT :
		if event.pressed:
			collected = true
		else:
			collected = false
