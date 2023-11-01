extends Area2D
var distance = 40
var moved = false
var newpos = 920
var oldpos =  887

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and not moved: 
		var tween = create_tween()
		tween.tween_property(self,"position:x",newpos,0.3)
		moved = true
	elif event is InputEventMouseButton and event.pressed and moved:
		moved = false
		var tween = create_tween()
		tween.tween_property(self,"position:x",oldpos,0.3)
