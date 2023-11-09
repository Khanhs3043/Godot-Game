extends CanvasLayer
var reason
func _process(_delta):
	$VBoxContainer/energy.value = $"../player".energy
	$VBoxContainer/breath.value = $"../player".breath
	
func display_lose():
	get_tree().paused = true
	$Lose/reason.text = reason
	$Lose.show()
func display_win():
	get_tree().paused = true
	$win.show()

func _on_trybtn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Medal/medal.tscn")
	$Lose.hide()
	Global.have_diary = false


func _on_quitbtn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")


func _on_again_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Medal/medal.tscn")
	$win.hide()
	Global.have_diary = false
	

func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")
