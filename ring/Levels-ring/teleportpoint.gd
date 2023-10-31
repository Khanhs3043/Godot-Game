extends Area2D


# Called when the node enters the scene tree for the first time.
var detect_player : bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if detect_player:
		$"../Player".global_transform.origin = $"../telepoint1".global_transform.origin


func _on_body_entered(body):
	detect_player = true 


func _on_body_exited(body):
	detect_player = false
