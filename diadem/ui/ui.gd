extends CanvasLayer

var can_spell = false
var spell
var open_guide = false
var open_hint = false

func show_hint():
	$mini_hint.show()
func _ready():
	$input_spell.hide()
	$mini_hint.hide()
func _process(_delta):
	if can_spell:
		$input_spell.show()
	else:
		$input_spell.hide()
	
	if open_guide:
		$manuscript.show()
	else:
		$manuscript.hide()
		
	if open_hint:
		$hint.show()
	else:
		$hint.hide()
func _on_spell_btn_pressed():
	if can_spell:
		can_spell = false
	else:
		can_spell = true


func _on_ok_btn_pressed():
	spell = $input_spell/TextEdit.get_line(0).to_lower()
	$input_spell/TextEdit.text = ""


func _on_guide_pressed():
	if open_guide:
		open_guide = false
	else:
		open_guide = true


func _on_mini_hint_pressed():
	if open_hint:
		open_hint = false
	else:
		open_hint = true

