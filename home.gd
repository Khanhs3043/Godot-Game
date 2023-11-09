extends CanvasLayer
var center
var story_show = true
var horcruxes
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	center = get_viewport().size/2
	$light.position = center
	$WinText.position = center
	horcruxes = $horcruxes.get_children()
	$frame.show()
	if not Global.told:
		var tween = create_tween()
		$frame/story.visible_ratio = 0
		tween.tween_property($frame/story,"visible_ratio",1,8)
	if Global.told:
		story_show = false
		$frame.global_position.y= $frame_position.global_position.y + 1000
	$diary_glow.modulate.a = 0
	$diadem_glow.modulate.a = 0
	$ring_glow.modulate.a = 0
	$locket_glow.modulate.a = 0
	$horcruxes.modulate.a = 0
	if Global.ring and Global.diadem and Global.diary and Global.locket and not Global.show_win:
		win()
		Global.show_win = true
	$frame.show()
	var tween = create_tween()
	$frame/story.visible_ratio = 0
	tween.tween_property($frame/story,"visible_ratio",1,8)
	if Global.diadem:
		$diadem/completed.show()
	if Global.diary:
		$diary/completed.show()
	if Global.locket:
		$medal/completed.show()
	if Global.ring:
		$ring/completed.show()
func win():
	var tween = create_tween()
	$horcruxes.show()
	tween.tween_property($horcruxes, "modulate:a",1,1).set_delay(2)
	for i in horcruxes:
		var horx = create_tween()
		horx.tween_property(i,"global_position:y",$frame_position.global_position.y + 170,1.5).set_delay(3)
	for i in horcruxes:
		var horx = create_tween()
		horx.tween_property(i,"global_position",$center.position - Vector2(100,90),0.3).set_delay(5)
	tween.tween_property($light, "visible",true,0.1).set_delay(3)
	tween.tween_property($horcruxes, "visible", false,0.1)
	tween.tween_property($WinText, "visible",true,0.1)
	tween.tween_property($light, "scale",Vector2(0.6,0.6),0.3)
	tween.tween_property($light, "modulate:a", 0,0.2).set_delay(0.4)
	tween.tween_property($WinText, "scale",Vector2(0.1,0.1),0.5).set_delay(2)
	tween.tween_property($WinText, "global_position",$winpos.global_position,0.5)
func _on_medal_pressed():
	get_tree().change_scene_to_file("res://Medal/medal.tscn")


func _on_diary_pressed():
	get_tree().change_scene_to_file("res://Diary/level/diary.tscn")


func _on_ring_pressed():
	get_tree().change_scene_to_file("res://ring/Levels-ring/test_level.tscn")


func _on_diadem_pressed():
	get_tree().change_scene_to_file("res://diadem/diadem.tscn")

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


func _on_xbtn_pressed():
	story_show = false
	Global.told = true
	var tween = create_tween()
	tween.tween_property($frame,"global_position:y",$frame_position.global_position.y + 1000,0.5)


func _on_vol_btn_pressed():
	if not story_show:
		var tween = create_tween()
		tween.tween_property($frame,"global_position:y",$frame_position.global_position.y,0.5)
