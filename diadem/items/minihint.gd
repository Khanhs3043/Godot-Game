extends Area2D
var can_collect = false 
var cover
var collected = false
func _on_area_entered(area):
	cover = area
func _process(_delta):
	if cover.visible == false:
		can_collect = true




func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and can_collect:
		collected = true
		hide()
