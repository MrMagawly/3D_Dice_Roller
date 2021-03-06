extends Node

signal rolled_standard
signal rolled_fate
signal rolled_narrative

var d_four_load
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
var d_fate_load
var die
var dice_finished_count
var dice_results

func _ready():
	d_four_load = load("res://Dice/Scenes/DFour.tscn")
	d_six_load = load("res://Dice/Scenes/DSix.tscn")
	d_eight_load = load("res://Dice/Scenes/DEight.tscn")
	d_ten_load = load("res://Dice/Scenes/DTen.tscn")
	d_twelve_load = load("res://Dice/Scenes/DTwelve.tscn")
	d_twenty_load = load("res://Dice/Scenes/DTwenty.tscn")
	d_fate_load = load("res://Dice/Scenes/Fate.tscn")
	d_boost_load = load("res://Dice/Scenes/Boost.tscn")
	d_setback_load = load("res://Dice/Scenes/Setback.tscn")
	d_ability_load = load("res://Dice/Scenes/Ability.tscn")
	d_difficulty_load = load("res://Dice/Scenes/Difficulty.tscn")
	d_proficiency_load = load("res://Dice/Scenes/Proficiency.tscn")
	d_challenge_load = load("res://Dice/Scenes/Challenge.tscn")
	d_force_load = load("res://Dice/Scenes/Force.tscn")
	dice_finished_count = 0
	dice_results = ""

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


func _on_ChatTerminal_got_dice_to_spawn(regular_dice, narrative_dice, fate_dice):
	spawn_dice(d_four_load, regular_dice.D4)
	spawn_dice(d_six_load, regular_dice.D6)
	spawn_dice(d_eight_load, regular_dice.D8)
	spawn_dice(d_ten_load, regular_dice.D10)
	spawn_dice(d_twelve_load, regular_dice.D12)
	spawn_dice(d_twenty_load, regular_dice.D20)
	#spawn_dice(d_hundred_load, regular_dice.D100)
	spawn_dice(d_boost_load, narrative_dice.Boost)
	spawn_dice(d_ability_load, narrative_dice.Ability)
	spawn_dice(d_proficiency_load, narrative_dice.Proficiency)
	spawn_dice(d_setback_load, narrative_dice.Setback)
	spawn_dice(d_difficulty_load, narrative_dice.Difficulty)
	spawn_dice(d_challenge_load, narrative_dice.Challenge)
	spawn_dice(d_force_load, narrative_dice.Force)
	spawn_dice(d_fate_load, fate_dice)
	die = get_children()

func spawn_dice(dice_load, count):
	for i in range(count):
		var dice = dice_load.instance()
		dice.connect("finished_rolling", self, "_on_dice_finished_rolling")
		add_child(dice)
		dice.translate(Vector3(rand_range(1,15), 5, rand_range(1,15)))
