extends can_interact
var disappear = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("input_event",_on_input_event)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		shake()
		var tween = create_tween()
		tween.tween_property(self, "visible",false,0.5)
		$Area2D.visible = false
		disappear = true
		#$".".hide()

