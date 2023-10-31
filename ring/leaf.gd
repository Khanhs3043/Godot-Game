extends Area2D
class_name leaf
var player_detected : bool = false


func _process(delta):
	if player_detected == true :
		if Input.is_action_just_pressed("interact"):
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0,-30), 0.5)
			tween.tween_property(self, "modulate:a", 0.0, 0.5)
			tween.tween_callback(self.queue_free)


func _on_body_entered(body):
	player_detected = true

func _on_body_exited(body):
	player_detected = false



