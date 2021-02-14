extends ScrollContainer

var v_bar

func _ready():
	v_bar = get_v_scrollbar()
	

func _on_ChatBox_item_added():
	pass


func _on_ChatBox_resized():
	v_bar.set_value(v_bar.get_max())

