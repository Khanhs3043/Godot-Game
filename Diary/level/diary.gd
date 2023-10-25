extends Node2D

var positions
var boxs
var random_box
var diary
var bubbleamount = 0
var have_diary = false
# Called when the node enters the scene tree for the first time.
func _ready():
	diary = preload("res://Diary/item/tdiary.tscn").instantiate()
	positions = $invispos.get_children()
	var listPosition = []
	for i in positions:
		listPosition.append(i.position)
	for i in range(20):
		# Đặt vị trí ngẫu nhiên cho item
		var random_position = listPosition[randi()%listPosition.size()] 
		var bubble = preload("res://Diary/item/bubble.tscn").instantiate()  # Tạo một thể hiện mới của 'bubble'
		bubble.global_position = random_position
		# Thêm item vào trò chơi
		add_child(bubble)
		# Xóa vị trí đó ra khỏi list để tránh trùng lặp vị trí
		listPosition.erase(random_position)
	boxs = $container.get_children()
	random_box = boxs[randi()%boxs.size()]
	random_box.add_child(diary)
	print(random_box.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if random_box.is_open and diary.is_ready:
		diary.show()
	elif not Global.have_diary :
		diary.hide()

func _on_woodendoor_1_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/woodendoor2/wdoor2pos.position


func _on_woodendoor_2_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/woodendoor1/wdoor1pos.position


func _on_irondoor_1_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/irondoor2/idoor2.position


func _on_irondoor_2_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/irondoor1/idoor1.position


func _on_emtydoor_1_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/emtydoor2/edoor2.position


func _on_emtydoor_2_body_entered(body):
	if body.name == "player":
		body.global_position = $trans/emtydoor1/edoor1.position


func _on_exit_body_entered(body):
	if body.name == "player" and Global.have_diary:
		print("Win!")
		$ui.display_win()
	else: 
		print("Lose!")
		$ui.display_lose()
