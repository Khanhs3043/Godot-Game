extends CanvasLayer
var timeleft
func _ready():
	$Lose.hide()
	$win.hide()
func update_bubbleAmount():
	$bubblecounter/VBoxContainer/count.text = str($"..".bubbleamount)
func countdown():
	timeleft = 10
	$countdown.text = "Invisibility: " + str(timeleft)
	timeleft -= 1
	$countdown/Timer.start()

func _on_timer_timeout():
	if timeleft >=0:
		$countdown.text =  "Invisibility: " + str(timeleft)
		timeleft -= 1
		$countdown/Timer.start()
	else:
		$countdown.text = ' '
func display_lose():
	get_tree().paused = true
	$Lose.show()
func display_win():
	get_tree().paused = true
	$win.show()

func _on_trybtn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Diary/level/diary.tscn")
	$Lose.hide()
	Global.have_diary = false


func _on_quitbtn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")


func _on_again_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Diary/level/diary.tscn")
	$win.hide()
	Global.have_diary = false
	


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://home.tscn")
