extends CanvasLayer
var reason

func display_win():
	$win.show()
	get_tree().paused = true
func display_lose():
	$lose/reason.text = reason
	$lose.show()
	get_tree().paused = true
func _ready():
	$win.hide()
	$lose.hide()


func _on_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://diadem/diadem.tscn")
	$lose.hide()

func _on_home_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")

func _on_play_again_1_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://diadem/diadem.tscn")
	$lose.hide()


func _on_home_1_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")
