extends CharacterBody2D
var speed = 1000  
var moveTimer = 8 
var currentDirection 
var moveTime = 0
var directions = ["left", "right","up","down"]
var dir = Vector2.ZERO
var sight
@onready var player = $"../../player"
func _ready():
	currentDirection = directions[randi()%directions.size()]
	sight = $sight.get_children()
func _process(delta):
	moveTime += delta
	if moveTime >= moveTimer:
		moveTime = 0
		currentDirection = directions[randi()%directions.size()]
	if currentDirection == "left":
			dir= Vector2(-1,0)
			$pinkani.play("walk_left")
			$sight.rotation_degrees = 90
			$sight.position.y = 0
	if currentDirection == "right":
			dir= Vector2(1,0)
			$pinkani.play("walk_right")
			$sight.rotation_degrees = 270
			$sight.position.y = 0
	if currentDirection == "up":
			dir= Vector2(0,1)
			$sight.rotation_degrees = 0
			$sight.position.y = 40
			$pinkani.play("walk_up")
	if currentDirection == "down":
			dir= Vector2(0,-1)
			$sight.rotation_degrees = 180
			$sight.position.y = 0
			$pinkani.play("walk_down")
	velocity = speed * dir * delta	
	move_and_slide()
	#nhin trung player
	for i in sight:
		if i.is_colliding() and i.get_collider() == player:
			if not player.is_invisible:
				player.moveto(global_position)
				$"../../ui".reason = "This person has seen you"
				set_process(false)
				await get_tree().create_timer(0.5).timeout
				$"../../ui".display_lose()
func _on_area_2d_body_entered(_body):
	if currentDirection == "left":
		currentDirection = "right"
	elif currentDirection == "right":
		currentDirection = "left"
	elif currentDirection == "up":
		currentDirection = "down"
	elif currentDirection == "down":
		currentDirection ="up"
