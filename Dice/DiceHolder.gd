extends Node

signal rolled_standard
signal rolled_fate
signal rolled_narrative

var d_six_load
var d_eight_load
var d_ten_load
var d_twelve_load
var d_twenty_load
var d_boost_load
var d_setback_load
var d_ability_load
var d_difficulty_load
var d_proficiency_load
var d_challenge_load
var d_force_load
var die
var dice_finished_count
var dice_results

func _ready():
	#d_four_load = load("res://Dice/Scenes/DFour.tscn")
	d_six_load = load("res://Dice/Scenes/DSix.tscn")
	d_eight_load = load("res://Dice/Scenes/DEight.tscn")
	d_ten_load = load("res://Dice/Scenes/DTen.tscn")
	d_twelve_load = load("res://Dice/Scenes/DTwelve.tscn")
	d_twenty_load = load("res://Dice/Scenes/DTwenty.tscn")
	#d_fate_load = load(res://Dice/Scenes/Fate.tscn)
	d_boost_load = load("res://Dice/Scenes/Boost.tscn")
	d_setback_load = load("res://Dice/Scenes/Setback.tscn")
	d_ability_load = load("res://Dice/Scenes/Ability.tscn")
	d_difficulty_load = load("res://Dice/Scenes/Difficulty.tscn")
	d_proficiency_load = load("res://Dice/Scenes/Proficiency.tscn")
	d_challenge_load = load("res://Dice/Scenes/Challenge.tscn")
	#d_force_load = load("res://Dice/Scenes/Force.tscn")
	dice_finished_count = 0
	dice_results = ""
	
	var count = 0
	while count < 1:
		var dice_one = d_boost_load.instance()
		var dice_two = d_setback_load.instance()
		var dice_three = d_ability_load.instance()
		var dice_four = d_difficulty_load.instance()
		var dice_five = d_challenge_load.instance()
		var dice_six = d_proficiency_load.instance()
		#var dice_seven = d_force_load.instance()
		#dice_one.connect("finished_rolling", self, "_on_dice_finished_rolling")
		#dice_two.connect("finished_rolling", self, "_on_dice_finished_rolling")
		dice_three.connect("finished_rolling", self, "_on_dice_finished_rolling")
		dice_four.connect("finished_rolling", self, "_on_dice_finished_rolling")
		#dice_five.connect("finished_rolling", self, "_on_dice_finished_rolling")
		#dice_six.connect("finished_rolling", self, "_on_dice_finished_rolling")
		#dice_seven.connect("finished_rolling", self, "_on_dice_finished_rolling")
		#add_child(dice_one)
		#add_child(dice_two)
		add_child(dice_three)
		add_child(dice_four)
		#add_child(dice_five)
		#add_child(dice_six)
		#add_child(dice_seven)
		#dice_one.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		#dice_two.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		dice_three.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		dice_four.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		#dice_five.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		#dice_six.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		#dice_seven.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
		count += 1
	
	die = get_children()

func _on_dice_finished_rolling(result, type):
	dice_finished_count += 1
	dice_results += result
	
	if dice_finished_count >= die.size():
		dice_finished_count = 0
		
		match type:
			0:
				emit_signal("rolled_standard", dice_results)
			1:
				emit_signal("rolled_fate", dice_results)
			2:
				emit_signal("rolled_narrative", dice_results)
		
		dice_results = ""
