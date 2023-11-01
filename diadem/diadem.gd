extends Node2D
var is_zoom = false
var mousepos
var campos = Vector2(577,323)
var light = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if $room.win :
		$losewin.display_win()
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
	
