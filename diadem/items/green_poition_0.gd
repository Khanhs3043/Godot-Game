extends can_interact
class_name poition
var drank = false
var type = "green"
func _ready():
	$drink.hide()
	$drink.connect("drank",_on_drink_drank)
	$Area2D.connect("input_event",_on_area_2d_input_event)
func _process(_delta):
	if $drink.drink:
		drank = true
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		shake()
		$drink.show()
		
func _on_drink_drank():
	$"../..".drank_list.append(type)
