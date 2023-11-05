extends CanvasLayer
var at_door = false
signal wanna_exit 
var exit = false
func _ready():
	$exit.hide()
func open_door():
	$AnimatedSprite2D.frame = 1
func show_exit():
	$exit.show()
func _on_go_inside_pressed():
	at_door = false
	hide()


func _on_exit_pressed():
	exit = true
