extends CharacterBody2D
@export var speed = 2000
var dir
var dirs=[Vector2(0,1),Vector2(1,0),Vector2(-1,0), Vector2(0,-1)]
var movetime = 0
var movetimer = 8
var playerentered = false
var hit_count = 0
var in_water = true
@onready var player = $"../../player"

func isbone():
	return true

func _ready():
	dir = dirs[randi()%dirs.size()]
	
func bone_hit():
	hit_count +=1
	if(hit_count<5):
		var tween = get_tree().create_tween()
		tween.tween_property($".","modulate",Color(0.8, 0, 0),0.2)
		tween.tween_property($".","modulate",Color(1, 1, 1),0.2)
		
func _process(delta):
	if hit_count == 2: 
		$body.frame = 1
	if hit_count == 4: 
		$body.frame = 2
	if dir == Vector2(0,1):
		rotation_degrees = 90
	if dir == Vector2(0,-1):
		rotation_degrees = -90
	if dir == Vector2(1,0):
		rotation_degrees = 0
	if dir == Vector2(-1,0):
		rotation_degrees = 180
	if not playerentered:
		movetime += delta
		if movetime >= movetimer:
			movetime =0
			dir = dirs[randi()%dirs.size()]
	if not in_water:
		dir = Vector2.DOWN
	if playerentered and in_water:
		speed = 4000
		dir = Vector2(player.global_position - global_position).normalized()
		look_at(player.global_position)
	velocity = dir * speed *delta
	#rotation = rad_to_deg(atan2(dir.x,-dir.y))	
	move_and_slide()
	if hit_count ==5: # điều kiện bị giết
		queue_free()
		
func _on_area_2d_body_entered(body):
	if body.name == "player":
		playerentered = true
		


func _on_area_2d_body_exited(body):
	if body.name == "player":
		playerentered = false
