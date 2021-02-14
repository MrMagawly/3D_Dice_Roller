extends Control

signal window_size_changed
signal done_with_text
signal got_rolled_narrative_result

var command_called = false
var current = 0
var sent_text = ""
var commands = ["roll"]
var macros = {}

func _ready():
	get_tree().get_root().get_viewport().connect("size_changed", self, "_on_size_changed")
	rect_size = Vector2(ProjectSettings.get_setting("display/window/size/width"), 
						ProjectSettings.get_setting("display/window/size/height"))

func _on_size_changed():
	var new_size = Vector2(ProjectSettings.get_setting("display/window/size/width"), 
						ProjectSettings.get_setting("display/window/size/height"))
	rect_size = new_size
	emit_signal("window_size_changed", new_size)

# TODO: Build a FSM.
func _on_TextBox_pressed_enter(text):
	sent_text = text
	scan_text()
	#do some stuff to text before emitting the signal.
	emit_signal("done_with_text", text)

func scan_text():
	while current < sent_text.length():
		match sent_text[current]:
			"/":
				if command_called == true:
					command_called = false
					break
				check_command()
			"#":
				pass
			"0":
				print("has zero")
			"1":
				pass
			"2":
				pass
			"3":
				pass
			"4":
				pass
			"5":
				pass
			"6":
				pass
			"7":
				pass
			"8":
				pass
			"9":
				print("has nine")
		
		current += 1

func check_command():
	var command = ""
	current += 1
	
	while (sent_text.ord_at(current) != 32 and sent_text.ord_at(current) != 10 
	and sent_text.ord_at(current) != 9):
		print(sent_text.ord_at(current))
		command += sent_text[current]
		current += 1
	
	match command:
		"roll":
			command_called = true
			print("roll command was called.")

func check_macro(cur_pos):
	pass

func check_number():
	var num = sent_text[current]
	
	while (sent_text.ord_at(current) != 32 and sent_text.ord_at(current) != 10 
	and sent_text.ord_at(current) != 9):
		pass

func _on_DiceHolder_rolled_narrative(result):
	emit_signal("got_rolled_narrative_result", result)
