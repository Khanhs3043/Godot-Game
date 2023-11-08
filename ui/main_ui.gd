extends CanvasLayer
class_name ui
var guide_show = true 
func _ready():
	pass
func set_text(text, time):
	$frame/text.text = text
	var tween = create_tween()
	$frame/text.visible_ratio = 0
	tween.tween_property($frame/text,"visible_ratio",1,time)

func _process(_delta):
	pass


func _on_home_pressed():
	get_tree().change_scene_to_file("res://home.tscn")

func _on_guide_pressed():
	if $frame.visible:
		$frame.hide()
	elif not $frame.visible:
		$frame.show()


func _on_x_pressed():
	$frame.hide()
