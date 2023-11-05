extends RigidBody2D
var in_hand = false
var speed = 4000
var dir = Vector2.DOWN
var disable = false
func _ready():
	global_position.x = randi()%1380 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not in_hand:
		linear_velocity = delta*speed*dir
		$"../player".locket_in_hand = false
		disable = false
	else: 
		global_position = $"../player".hand
		$"../player".locket_in_hand = true		
		disable = true
	if disable:
		$CollisionShape2D.disabled = true
	else:
		$CollisionShape2D.disabled = false
