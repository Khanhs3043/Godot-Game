extends Area2D
var collected = false
func _ready():
	$Ray.hide()
func _process(_delta):
	$Ray.rotate(0.01)
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var tween = create_tween()
		tween.tween_property(self,"modulate:a",0, 0.5)
		collected = true
		
func fly_out():
	var tween = create_tween()
	global_position = Vector2(620,323)
	tween.tween_property(self,"scale",Vector2(2,2),1)
	$Ray.show()
