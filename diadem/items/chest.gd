extends Node2D

var can_open = false
var diadem_in_hand = false
func _ready():
	$dd.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $dd.collected:
		diadem_in_hand = true
	if can_open:
		$ani.frame = 1
		$dd.show()
		$dd.fly_out()
	else:
		$ani.frame = 0


func _on_area_2d_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.has_method("is_key"):
		can_open = true
	else: can_open = false

func shake():
	var tween = create_tween()
	tween.tween_property(self,"rotation_degrees",15,0.1)
	tween.tween_property(self,"rotation_degrees",-15,0.1)
	tween.tween_property(self,"rotation_degrees",0,0.1)
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and not can_open:
		shake()
