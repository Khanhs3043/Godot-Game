extends CanvasLayer
signal drank
var drink = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass


func _on_drink_btn_pressed():
	drink = true
	drank.emit()
	hide()

func _on_cancel_btn_pressed():
	hide()
