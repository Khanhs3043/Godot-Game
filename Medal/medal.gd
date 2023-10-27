extends Node2D
@export var bubble_creation_time = 2
var time = 0
var bubbles = ["energy","breath","breath"]
var bubblepos
var listpos = []
var win = false
var lose = false
func _ready():
	bubblepos = $bubbleborn.get_children()
	create_bubble()
		
func create_bubble():
	for i in bubblepos:
		listpos.append(i.global_position)
	for i in range(3):
		var item
		var randompos = listpos[randi()%listpos.size()]
		var bubble = bubbles[randi()%bubbles.size()]
		if bubble =="energy":
			item = preload("res://Medal/item/energy.tscn").instantiate()
		if bubble == "breath":
			item = preload("res://Medal/item/breath.tscn").instantiate()
		item.global_position = randompos
		listpos.erase(randompos)
		$bubbles.add_child(item)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time>= bubble_creation_time:
		time = 0
		create_bubble()
	if lose:
		$ui.display_lose()
	if win:
		$ui.display_win()
	if $player.dead:
		$ui.display_lose()

func _on_player_avada(direction):
	var curse = preload("res://Medal/item/avada.tscn").instantiate()
	curse.position = $player.position
	$curses.add_child(curse)
	curse.rotation_degrees = rad_to_deg(direction.angle()) + 90
	curse.direction = direction


func _on_air_body_entered(body):
	if body.name == "player":
		body.on_the_ground = true
	if body.has_method("isbone"):
		body.in_water = false
		body.dir = Vector2.DOWN


func _on_air_body_exited(body):
	if body.name == "player":
		body.on_the_ground = false
	if body.has_method("isbone"):
		body.in_water = true


func _on_air_area_entered(area):
	if area.has_method("is_breath") or area.has_method("is_energy") :
		area.queue_free()


func _on_exit_body_entered(body):
	if body.name == "player" and body.locket_in_hand:
		win = true
	if body.name == "player" and not body.locket_in_hand:
		lose = true
