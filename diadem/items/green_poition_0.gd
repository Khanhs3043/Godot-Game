extends can_interact
class_name poition
var drank = false
var type = "green"
var caninteract =  true
var show_drink = false
var list_poitions
var mouse_over = false
var text 
func _ready():
	list_poitions = $"..".get_children()
	$drink.hide()
	$drink.connect("drank",_on_drink_drank)
	$Area2D.connect("input_event",_on_area_2d_input_event)

func _process(_delta):
	if $drink.drink:
		drank = true
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and caninteract:
		shake()
		text = "Drink this " + type + " liquid ???"
		$drink.setText(text)
		$drink.show()
func _on_drink_drank():
	$"../..".drank_list.append(type)


func _on_area_2d_mouse_entered():
	mouse_over = true

func _on_area_2d_mouse_exited():
	mouse_over = false
