extends Sprite2D
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var tween = create_tween()
		angle += 40
		tween.tween_property(self, "rotation_degrees",angle,0.2)
	
