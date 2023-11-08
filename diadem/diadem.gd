extends Node2D
var light = false

func _ready():
	
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
