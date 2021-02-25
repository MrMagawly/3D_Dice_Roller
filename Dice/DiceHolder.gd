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


func _on_ChatTerminal_got_dice_to_spawn(regular_dice, narrative_dice, fate_dice):
	spawn_dice(d_six_load.instance(), regular_dice.D6)
	spawn_dice(d_eight_load.instance(), regular_dice.D8)
	spawn_dice(d_ten_load.instance(), regular_dice.D10)
	spawn_dice(d_twelve_load.instance(), regular_dice.D12)
	spawn_dice(d_twenty_load.instance(), regular_dice.D20)
	#spawn_dice(d_hundred_load.instance(), regular_dice.D100)
	spawn_dice(d_boost_load.instance(), narrative_dice.Boost)
	spawn_dice(d_ability_load.instance(), narrative_dice.Ability)
	spawn_dice(d_proficiency_load.instance(), narrative_dice.Proficiency)
	spawn_dice(d_setback_load.instance(), narrative_dice.Setback)
	spawn_dice(d_difficulty_load.instance(), narrative_dice.Difficulty)
	spawn_dice(d_challenge_load.instance(), narrative_dice.Challenge)
	#spawn_dice(d_force_load.instance(), narrative_dice.Force)
	#spawn_dice(d_fate_load.instance(), fate_dice)

func spawn_dice(dice, count):
	for i in range(count):
		dice.connect("finished_rolling", self, "_on_dice_finished_rolling")
		add_child(dice)
		dice.translate(Vector3(rand_range(1,15),rand_range(1,5),rand_range(1,15)))
