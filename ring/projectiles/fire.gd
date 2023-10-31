extends Area2D
@onready var animated_sprite : Sprite2D = $Sprite2D
@export var speed = 100
var direction = 1 

func set_direction(new_direction):
	direction = new_direction

func _process(delta):
	var velocity = Vector2(speed * direction, 0)
	translate(velocity * delta)
	update_facing_direction()

func update_facing_direction():
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	queue_free()
	
