extends ItemList



func _ready():
	pass

func _on_ChatBox_done_with_text(text):
	add_item(text)