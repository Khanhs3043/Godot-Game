extends can_interact
var drank = false
var type = "yellow"

func _ready():
	$drink.hide()
	$drink.connect("drank",_on_drink_drank)

func _process(_delta):
	if $drink.drink:
		drank = true
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		shake()
		$drink.show()
		


func _on_drink_drank():
	$"../..".drank_list.append(type)
