extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_medal_pressed():
	get_tree().change_scene_to_file("res://Medal/medal.tscn")


func _on_diary_pressed():
	get_tree().change_scene_to_file("res://Diary/level/diary.tscn")


func _on_ring_pressed():
	get_tree().change_scene_to_file("res://ring/Levels-ring/test_level.tscn")


func _on_diadem_pressed():
	get_tree().change_scene_to_file("res://diadem/diadem.tscn")
