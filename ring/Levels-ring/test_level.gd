extends Node2D

var solution_collected : bool = false
var venom_collected : bool = false
var leaf_collected : bool = false

func _ready():
	var text = "\n'Here i am in the Mystical Forrest. The Ring is right here but the Myths said it is cursed.\nCan't risk touching it! there's gotta be a way to lift the curse' \nPress: AD to move left and right, SPACE to jump, leftclick to cast fireball\n\n Objective: Lift the curse and take the ring"
	$main_ui.set_text(text,3)

func _on_boardialogue_body_entered(body):

	var text = "There's a BIG boar down there, feel strange about this one!"
	$main_ui.set_text(text,2)
	$main_ui/frame.show()
	$boardialogue.queue_free()

func _on_flowerdialogue_body_entered(body):
	var text = "Huh? It feels like some source of magical stream flowing down this way.\nA magical flower maybe? \nBetter not fall!"
	$main_ui.set_text(text,2)
	$main_ui/frame.show()
	$flowerdialogue.queue_free()

func _on_area_2d_3_body_entered(body):
	var text = " Toxin thorn? they're larger than normal, strange!\ngotta get rid of them! Fireball might do the trick "
	$main_ui.set_text(text,2)
	$main_ui/frame.show()
	$venomdiag.queue_free()


func _on_win_body_entered(body):
	if solution_collected && venom_collected && leaf_collected :
		var text = " Ok, i have collected all ingredients to lift the curse.\nHere goes nothing! "
		$main_ui.set_text(text,2)
		$main_ui/frame.show()
		$win.queue_free()
