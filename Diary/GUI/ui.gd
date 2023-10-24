extends CanvasLayer
var timeleft
func update_bubbleAmount():
	$bubblecounter/VBoxContainer/count.text = str(Global.bubbleamount)
func countdown():
	timeleft = 10
	$countdown.text = "Invisibility: " + str(timeleft)
	timeleft -= 1
	$countdown/Timer.start()

func _on_timer_timeout():
	if timeleft >=0:
		$countdown.text =  "Invisibility: " + str(timeleft)
		timeleft -= 1
		$countdown/Timer.start()
	else:
		$countdown.text = ' '
