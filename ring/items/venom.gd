extends Area2D
class_name venom
var player_detected : bool = false

func _ready():
	pass # Replace with function body.



func _process(delta):
	if player_detected == true:
		if Input.is_action_just_pressed("interact"):
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0,-30), 0.5)
			tween.tween_property(self, "modulate:a", 0.0, 0.5)
			tween.tween_callback(self.queue_free)


func _on_body_entered(body):
	player_detected = true
	print("player in")

func _on_body_exited(body):
	player_detected = false
	print("player out")
