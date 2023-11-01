extends Sprite2D
class_name can_interact
var moved = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		pass
func shake():
	var tween = create_tween()
	tween.tween_property(self,"rotation_degrees",15,0.1)
	tween.tween_property(self,"rotation_degrees",-15,0.1)
	tween.tween_property(self,"rotation_degrees",0,0.1)
func move(distance):
	global_position.x -= distance
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		shake()
		
