extends Node2D



func _on_triggerhitbox_body_entered(body):
	queue_free()
