extends Node2D

var sollution_collected : bool = false
var venom_collected : bool = false
var leaf_collected : bool = false
var text5 = "Ok, got all the ingredients, time to go lift the curse on the Ring"
func _ready():
	var text1 = "\n'Here i am in the Mystical Forrest. The Ring is right here but the Myths said it is cursed.\nCan't risk touching it! there's gotta be a way to lift the curse' \nPress: AD to move left and right, SPACE to jump, leftclick to cast fireball\n\n Objective: Lift the curse and take the ring"
	$main_ui.set_text(text1,3)

func _on_boardialogue_body_entered():
	var text2 = "There's a BIG boar down there, feel strange about this one!"
	$main_ui.set_text(text2,2)
	$main_ui/frame.show()
	$boardialogue.queue_free()

func _on_flowerdialogue_body_entered():
	var text3 = "Huh? It feels like some source of magical stream flowing down this way.\nA magical flower maybe? \nBetter not fall!"
	$main_ui.set_text(text3,2)
	$main_ui/frame.show()
	$flowerdialogue.queue_free()

func _on_area_2d_3_body_entered():
	var text4 = " Toxin thorn? they're larger than normal, strange!\ngotta get rid of them! Fireball might do the trick "
	$main_ui.set_text(text4,2)
	$main_ui/frame.show()
	$venomdiag.queue_free()

func _on_leaf_tree_exited():
	leaf_collected = true
	if sollution_collected && venom_collected && leaf_collected :
		$main_ui.set_text(text5,2)
		$main_ui/frame.show()

func _on_venom_tree_exited():
	venom_collected = true
	if sollution_collected && venom_collected && leaf_collected :
		$main_ui.set_text(text5,2)
		$main_ui/frame.show()

func _on_solution_tree_exited():
	sollution_collected = true
	if sollution_collected && venom_collected && leaf_collected :
		$main_ui.set_text(text5,2)
		$main_ui/frame.show()
