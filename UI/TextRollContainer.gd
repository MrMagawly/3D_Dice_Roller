extends Control


var advantage 
var darkside
var despair
var failure 
var lightside
var success 
var threat
var triumph


func _ready():
	advantage = load("res://Dice/Textures/Narrative_Dice_Symbols/AdvantageIcon.tscn")
	despair = load("res://Dice/Textures/Narrative_Dice_Symbols/DespairIcon.tscn")
	failure = load("res://Dice/Textures/Narrative_Dice_Symbols/FailureIcon.tscn")
	success = load("res://Dice/Textures/Narrative_Dice_Symbols/SuccessIcon.tscn")
	threat = load("res://Dice/Textures/Narrative_Dice_Symbols/ThreatIcon.tscn")
	triumph = load("res://Dice/Textures/Narrative_Dice_Symbols/TriumphIcon.tscn")
	

func insert_text(typed_text):
	var label_for_text = Label.new()
	label_for_text.autowrap = true
	label_for_text.text = typed_text
	add_child(label_for_text)


func insert_fate_results():
	pass


func insert_regular_results(result):
	pass


func insert_narrative_result(result):
	var advantages = 0
	var despairs = 0
	var difficulties = 0
	var failures = 0
	var lightsides = 0
	var darksides = 0
	var successes = 0
	var threats = 0
	var triumphs = 0
	
	var i = 0
	while i < result.length():
		match result.substr(i, 1):
			"A":
				advantages += 1
			"D":
				despairs += 1
			"F":
				failures += 1
			"S":
				successes += 1
			"t":
				threats += 1
			"T":
				triumphs += 1
			"d":
				darksides += 1
			"L":
				lightsides += 1
		i += 1
	
	if successes > failures:
		successes -= failures
		failures = 0
	else:
		failures -= successes
		successes = 0
	
	if advantages > threats:
		advantages -= threats
		threats = 0
	else:
		threat -= advantages
		advantages = 0
	
	var symbol_grid = GridContainer.new()
	symbol_grid.set_columns(7)
	
	push_to_symbol_grid(symbol_grid, success, successes)
	push_to_symbol_grid(symbol_grid, failure, failures)
	push_to_symbol_grid(symbol_grid, advantage, advantages)
	push_to_symbol_grid(symbol_grid, threat, threats)
	push_to_symbol_grid(symbol_grid, triumph, triumphs)
	push_to_symbol_grid(symbol_grid, despair, despairs)
	
	add_child(symbol_grid)

func push_to_symbol_grid(grid, symbol, count):
	while count > 0:
		grid.add_child(symbol.instance())
		count -= 1
