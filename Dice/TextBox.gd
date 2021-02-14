extends TextEdit

signal pressed_enter

func _on_TextBox_focus_entered():
	set_process(true)

func _on_TextBox_focus_exited():
	set_process(false)

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		if all_spaces() == false:
			emit_signal("pressed_enter", text)
		text = ""

func all_spaces():
	var i = 0
	
	while i < text.length():
		if text.ord_at(i) != 10 and text.ord_at(i) != 32 and text.ord_at(i) != 9:
			return false
		i += 1
	
	return true