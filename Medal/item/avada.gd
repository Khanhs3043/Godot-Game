extends Area2D
var direction = Vector2.UP
@export var speed = 700
func  _process(delta):
	position += speed*delta*direction


func _on_body_entered(body):
	if body.has_method("bone_hit"):
		body.bone_hit()
	if body.name != "player":
		queue_free()
