extends CanvasLayer
signal drank
var drink = false
var mouse_over = false
func _ready():
	pass

func _process(_delta):
	pass


func _on_drink_btn_pressed():
	drink = true
	drank.emit()
	hide()
func setText(text):
	$Label.text = text
func _on_cancel_btn_pressed():
	hide()





func _on_drink_btn_mouse_entered():
	mouse_over = true
	


func _on_drink_btn_mouse_exited():
	mouse_over = false


func _input(event):
	if event is InputEventMouseButton and event.pressed and not mouse_over:
		hide()
