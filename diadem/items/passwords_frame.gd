extends can_interact
var is_hide = false

func _ready():
	$passwords.hide()
func _process(_delta):
	if $passwords.can_open:
		hide()
		is_hide = true
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$passwords.show()
