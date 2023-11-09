extends Node2D
var is_zoom = false
var mousepos
var drank_list = []
var poitions
var lose = false
var win = false
var list_pos = []
var list_poitions 
var supersight_poition
var go_out = false
var frame_x: float 
var frame_y: float 
var campos = Vector2(557,323)
var rat
func _ready():
	frame_x = get_viewport().size.x
	frame_y = get_viewport().size.y
	list_poitions = $poitions.get_children()
	var random_poition = list_poitions[randi()%list_poitions.size()]
	supersight_poition = random_poition
	var list = $minihint_pos.get_children()
	$key.hide()
	$hint.hide()
	$ProphecyBall/Hint1.hide()
	for i in list :
		list_pos.append(i.global_position)
	var random_pos = list_pos[randi()%list_pos.size()]
	$minihint.global_position = random_pos
	print(supersight_poition.name)

func _process(_delta):
	if Input.is_action_just_pressed("z") and is_zoom:
		mousepos = get_global_mouse_position()
		var tween = create_tween()
		tween.tween_property($Camera2D,"zoom",Vector2(1,1),0.3)
		tween.tween_property($Camera2D,"position",campos,0.3)
		is_zoom = false
	elif Input.is_action_just_pressed("z") and not is_zoom:
		mousepos = get_global_mouse_position()
		var tween = create_tween()
		$Camera2D.global_position = mousepos
		tween.tween_property($Camera2D,"zoom",Vector2(2.5,2.5),0.3)
		is_zoom = true
	rat = get_viewport().size.x/1152.0
	scale = Vector2(rat,rat)
	$Camera2D.limit_right = frame_x * rat
	$Camera2D.limit_bottom = frame_y * rat
	if $chest.diadem_in_hand and go_out:
		win = true
	if not $chest.diadem_in_hand and go_out:
		$"../losewin".reason = "You went out without Diadem"
		lose = true
	if drank_list.has("red") and drank_list.has("green") and drank_list.has("blue"):
		$"../losewin".reason = "You die of poison"
		lose = true
	if supersight_poition.drank:
		$hint.show()
		$ProphecyBall/Hint1.show()
	if $passwords_frame.is_hide:
		$key.show()
	if $chest.can_open:
		$key.hide()
	


func _on_minihint_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and $minihint.collected:
		$"../ui".show_hint()



func _on_exit_door_wanna_exit():
	go_out = true
