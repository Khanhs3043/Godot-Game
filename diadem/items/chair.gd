extends Node2D

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed: 
		var tween = create_tween()
		tween.tween_property(self,"rotation_degrees",15,0.3)
		tween.tween_property(self,"rotation_degrees",-10,0.3)
		tween.tween_property(self,"rotation_degrees",0,0.2)
