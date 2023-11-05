extends Node2D

var drank_list = []
var poitions
var lose = false
var win = false
var list_pos = []
var list_poitions 
var supersight_poition
var go_out = false
func _ready():
	list_poitions = $poitions.get_children()
	var random_poition = list_poitions[randi()%list_poitions.size()]
	supersight_poition = random_poition
	var list = $minihint_pos.get_children()
	$key.hide()
	$hint.hide()
	
	for i in list :
		list_pos.append(i.global_position)
	var random_pos = list_pos[randi()%list_pos.size()]
	$minihint.global_position = random_pos
	print(supersight_poition.name)

func _process(_delta):
	if $chest.diadem_in_hand and go_out:
		win = true
	if not $chest.diadem_in_hand and go_out:
		lose = true
	if drank_list.has("red") and drank_list.has("green") and drank_list.has("blue"):
		lose = true
	if supersight_poition.drank:
		$hint.show()
	if $passwords_frame.is_hide:
		$key.show()
	if $chest.can_open:
		$key.hide()
	


func _on_minihint_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and $minihint.collected:
		$"../ui".show_hint()



func _on_exit_door_wanna_exit():
	go_out = true
