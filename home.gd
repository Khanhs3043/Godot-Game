extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$diary/completed.hide()
	$diadem/completed.hide()
	$ring/completed.hide()
	$medal/completed.hide()
	$cup/completed.hide()
	$diary_glow.modulate = Color(1,1,1,0)
	$diadem_glow.modulate = Color(1,1,1,0)
	$cup_glow.modulate = Color(1,1,1,0)
	$ring_glow.modulate = Color(1,1,1,0)
	$locket_glow.modulate = Color(1,1,1,0)
		
func _process(_delta):
	if Global.diadem:
		$diadem/completed.show()
	if Global.diary:
		$diary/completed.show()
	if Global.locket:
		$medal/completed.show()
	if Global.ring:
		$ring/completed.show()
	if Global.cup:
		$cup/completed.show()
	
func _on_medal_pressed():
	get_tree().change_scene_to_file("res://Medal/medal.tscn")


func _on_diary_pressed():
	get_tree().change_scene_to_file("res://Diary/level/diary.tscn")


func _on_ring_pressed():
	get_tree().change_scene_to_file("res://ring/Levels-ring/test_level.tscn")


func _on_diadem_pressed():
	get_tree().change_scene_to_file("res://diadem/diadem.tscn")


func _on_cup_pressed():
	pass # Replace with function body.


func _on_diary_mouse_entered():
	var tween = create_tween()
	tween.tween_property($diary_glow,"modulate",Color(1,1,1,1),0.3)

func _on_diary_mouse_exited():
	var tween = create_tween()
	tween.tween_property($diary_glow,"modulate",Color(1,1,1,0),0.3)


func _on_medal_mouse_entered():
	var tween = create_tween()
	tween.tween_property($locket_glow,"modulate",Color(1,1,1,1),0.3)


func _on_medal_mouse_exited():
	var tween = create_tween()
	tween.tween_property($locket_glow,"modulate",Color(1,1,1,0),0.3)


func _on_ring_mouse_entered():
	var tween = create_tween()
	tween.tween_property($ring_glow,"modulate",Color(1,1,1,1),0.3)


func _on_ring_mouse_exited():
	var tween = create_tween()
	tween.tween_property($ring_glow,"modulate",Color(1,1,1,0),0.3)


func _on_diadem_mouse_entered():
	var tween = create_tween()
	tween.tween_property($diadem_glow,"modulate",Color(1,1,1,1),0.3)


func _on_diadem_mouse_exited():
	var tween = create_tween()
	tween.tween_property($diadem_glow,"modulate",Color(1,1,1,0),0.3)


func _on_cup_mouse_entered():
	var tween = create_tween()
	tween.tween_property($cup_glow,"modulate",Color(1,1,1,1),0.3)


func _on_cup_mouse_exited():
	var tween = create_tween()
	tween.tween_property($cup_glow,"modulate",Color(1,1,1,0),0.3)


func _on_game_name_mouse_entered():
	var tween = create_tween()
	tween.tween_property($bg/game_name,"modulate",Color(0.6,0.1,0),0.3)


func _on_game_name_mouse_exited():
	var tween = create_tween()
	tween.tween_property($bg/game_name,"modulate",Color(1,1,1),0.3)
