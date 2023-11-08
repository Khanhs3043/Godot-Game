extends Node2D
var light = false

func _ready():
	var text = "\"This is a \"Request Room\", typically a \"Request Room\" can be used according to the user's desires, but somehow now it requires the user to search for clues and solve puzzles to find what they want.\"\n\nGameplay: Interact with objects by clicking the mouse to discover clues for solving puzzles. \n\nGoal: Retrieve the Diadem and take it outside."
	$main_ui.set_text(text,3)
	$exit_door.hide()

func _process(_delta):
	if $room.win :
		$losewin.display_win()
		Global.diadem = true
	if $room.lose :
		$losewin.display_lose()
	if $ui.spell == "lumos":
		light = true
	elif $ui.spell == "nox":
		light = false
	if light:
		$dark.hide()
	else:
		$dark.show()
		get_tree().paused = true

	if $exit_door.at_door and $ui.spell == "alohamorah":
		$exit_door.open_door()
		$exit_door.show_exit()
	if not $exit_door.at_door and $ui.spell == "alohamorah":
		$ui.spell = ""
	if $exit_door.exit:
		$exit_door.wanna_exit.emit()
func _on_go_outside_pressed():
	$exit_door.show()
	$exit_door.at_door = true
