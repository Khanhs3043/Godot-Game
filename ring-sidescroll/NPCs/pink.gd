extends CharacterBody2D
var speed = 1000  
var moveTimer = 8 
var currentDirection 
var moveTime = 0
var directions = ["left", "right","up","down","stop"]
var dir = Vector2.ZERO
var iscollide = false

func _ready():
	currentDirection = directions[randi()%directions.size()]
func _process(delta):
	moveTime += delta
	if moveTime >= moveTimer:
		moveTime = 0
		currentDirection = directions[randi()%directions.size()]
	if iscollide :
		currentDirection = directions[randi()%directions.size()]
		iscollide = false
	if currentDirection == "left":
			dir= Vector2(-1,0)
			$pinkani.play("walk_left")
	if currentDirection == "right":
			dir= Vector2(1,0)
			$pinkani.play("walk_right")
	if currentDirection == "up":
			dir= Vector2(0,1)
			$pinkani.play("walk_up")
	if currentDirection == "down":
			dir= Vector2(0,-1)
			$pinkani.play("walk_down")
	if currentDirection == "stop":
			dir= Vector2(0,0)
			$pinkani.stop()		
	velocity = speed * dir * delta	
	move_and_slide()

func _on_area_2d_body_entered(body):
	iscollide = true
	currentDirection = directions[randi()%directions.size()]
