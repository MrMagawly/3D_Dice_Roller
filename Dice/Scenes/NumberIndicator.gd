extends Node

var num_indicators = []
var face_value

func _ready():
	num_indicators = get_children()

func _process(delta):
	var best_dot = -1.0
	for i in range(num_indicators.size()):
		var world_space_vector = get_parent().to_global(num_indicators[i].get_translation())
		var dot = world_space_vector.dot(Vector3(0,1,0))
		if dot > best_dot:
			best_dot = dot
			face_value = int(num_indicators[i].name)