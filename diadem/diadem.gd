extends Node2D
var is_zoom = false
var mousepos
var campos = Vector2(577,323)
var light = false

func _ready():
	$exit_door.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	if Input.is_action_just_pressed("z") and is_zoom:
		mousepos = get_global_mouse_position()
		var tween = create_tween()
		#$Camera2D.global_position = campos
		tween.tween_property($Camera2D,"zoom",Vector2(1,1),0.3)
		tween.tween_property($Camera2D,"position",campos,0.3)
		
		is_zoom = false
	elif Input.is_action_just_pressed("z") and not is_zoom:
		mousepos = get_global_mouse_position()
		var tween = create_tween()
		$Camera2D.global_position = mousepos
		tween.tween_property($Camera2D,"zoom",Vector2(2.5,2.5),0.3)
		is_zoom = true
		
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
