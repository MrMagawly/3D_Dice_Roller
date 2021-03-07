extends VBoxContainer

signal item_added

func _ready():
	pass

func _on_ChatTerminal_done_with_text(text):
	var obj = load("res://UI/TextRollContainer.tscn")
	var tr_container = obj.instance()
	tr_container.insert_text(text)
	add_child(tr_container)
	emit_signal("item_added")


func _on_ChatTerminal_got_rolled_narrative_result(result):
	var obj = load("res://UI/TextRollContainer.tscn")
	var tr_container = obj.instance()
	tr_container.insert_narrative_result(result)
	add_child(tr_container)
	emit_signal("item_added")


func _on_ChatTerminal_got_rolled_fate_result(result):
	var obj = load("res://UI/TextRollContainer.tscn")
	var tr_container = obj.instance()
	tr_container.insert_fate_result(result)
	add_child(tr_container)
	emit_signal("item_added")
