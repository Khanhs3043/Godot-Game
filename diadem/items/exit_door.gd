extends CanvasLayer
var at_door = false
signal wanna_exit 
var exit = false
var opendoor_png
func _ready():
	$door/exit.hide()
	opendoor_png = preload("res://diadem/diadem-png/opendoor.png")
	
func open_door():
	$door.texture = opendoor_png
func show_exit():
	$door/exit.show()
func _on_go_inside_pressed():
	at_door = false
	hide()


func _on_exit_pressed():
	exit = true
