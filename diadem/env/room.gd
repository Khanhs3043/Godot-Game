extends Node2D

var drank_list = []
var poitions
var lose = false
var win = false
var list_pos = []
func _ready():
	var list = $minihint_pos.get_children()
	poitions = $poitions.get_children()
	$key.hide()
	$hint.hide()
	for i in list :
		list_pos.append(i.global_position)
	var random_pos = list_pos[randi()%list_pos.size()]
	$minihint.global_position = random_pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $chest.diadem_in_hand:
		win = true
	if drank_list.has("red") and drank_list.has("green") and drank_list.has("blue"):
		lose = true
	if $poitions/YellowPoition.drank:
		$hint.show()
	if $passwords_frame.is_hide:
		$key.show()



func _on_minihint_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$"../ui".show_hint()
