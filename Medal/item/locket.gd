extends RigidBody2D
var in_hand = false
var speed = 4000
var dir = Vector2.DOWN
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = randi()%1380 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not in_hand:
		linear_velocity = delta*speed*dir
		$"../player".locket_in_hand = false
	else: 
		global_position = $"../player".hand
		$"../player".locket_in_hand = true		
		freeze_mode = $".".FREEZE_MODE_KINEMATIC
		#freeze = true
