extends RigidBody

signal finished_rolling

enum DieType {STANDARD, FATE, NARRATIVE}
export (DieType) var die_type

var hand_position
var go_to_hand
var has_rolled
var stopped_rolling
var number_indicators
var good_math

func _ready():
	add_to_group("G_Dice")
	good_math = load("res://Utilities/GoodMath.gd")
	number_indicators = get_node("NumberIndicators").get_children()
	go_to_hand = false
	has_rolled = false
	stopped_rolling = false

func _integrate_forces(state):
	if stopped_rolling == true:
		return
	
	if go_to_hand:
		if hand_position.length() <= 4.0:
			set_linear_velocity(hand_position)
			#set_angular_velocity(hand_position)
		else:
			set_linear_velocity(hand_position * 5)
			#set_angular_velocity(hand_position * 5)
	elif !go_to_hand and linear_velocity.length() > 0.9:
		linear_velocity -= Vector3(0, 4, 0)
	else:
		gravity_scale = 1
		if linear_velocity.length() < 0.001 and angular_velocity.length() < 0.001:
			if has_rolled == true:
				stopped_rolling = true
				emit_signal("finished_rolling", get_rolled_value_alt(), die_type)

func awaken_dice():
	sleeping = false
	stopped_rolling = false
	has_rolled = false

func player_turning_dice(position):
	if has_rolled:
		return
		
	gravity_scale = 0
	hand_position = good_math.vector3_from_points(get_translation(), position) + Vector3(0,4,0)
	go_to_hand = true

func player_stopped_turning_dice():
	go_to_hand = false
	has_rolled = true

func get_rolled_value():
	var best_dot = -1.0
	var value = ""
	for i in range(number_indicators.size()):
		var world_space_vector = self.to_global(number_indicators[i].get_translation()).normalized()
		var dot = Vector3(0,1,0).dot(world_space_vector)
		if dot > best_dot:
			best_dot = dot
			value = number_indicators[i].name
	return value

func get_rolled_value_alt():
	var highest = -100
	var value = ""
	for i in range(number_indicators.size()):
		var point = to_global(number_indicators[i].get_translation())
		if point.y >= highest:
			highest = point.y
			value = number_indicators[i].name
	return value