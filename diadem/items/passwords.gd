extends CanvasLayer
var can_open = false
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	if $VBoxContainer/Passwords/zodiac/Zodiac.angle%360 == 320 and $VBoxContainer/Passwords/zodiac/Zodiac2.angle%360 == 200 and $VBoxContainer/Passwords/zodiac/Zodiac3.angle%360 == 240 and $VBoxContainer/Passwords/zodiac/Zodiac4.angle%360 == 80 and $VBoxContainer/Passwords/zodiac/Zodiac5.angle%360 == 160 :
		$Label.text = "TRUE"
		$Label.add_theme_color_override("font_color",Color.GREEN)
		can_open = true
	else:
		$Label.text = "FALSE"
		$Label.add_theme_color_override("font_color",Color.RED)
		can_open = false
func _on_texture_button_pressed():
	hide()
