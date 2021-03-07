extends Control


func insert_text(typed_text):
	var label_for_text = Label.new()
	label_for_text.autowrap = true
	label_for_text.text = typed_text
	add_child(label_for_text)


func insert_fate_result(result):
	var total = 0
	
	for i in result.length():
		match result.substr(i, 1):
			"p":
				total += 1
			"m":
				total -= 1
	
	insert_text(String(total))


func insert_regular_result(result):
	var total = 0
	
	for i in result.length():
		var str_part = result.substr(i, 1)
		if str_part.is_valid_integer(str_part):
			total += int(str_part)
	
	insert_text(String(total))


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
	
	for i in result.length():
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
		threats -= advantages
		advantages = 0
	
	var advantage = load("res://Dice/Textures/Narrative_Dice_Symbols/AdvantageIcon.tscn")
	var despair = load("res://Dice/Textures/Narrative_Dice_Symbols/DespairIcon.tscn")
	var failure = load("res://Dice/Textures/Narrative_Dice_Symbols/FailureIcon.tscn")
	var success = load("res://Dice/Textures/Narrative_Dice_Symbols/SuccessIcon.tscn")
	var threat = load("res://Dice/Textures/Narrative_Dice_Symbols/ThreatIcon.tscn")
	var triumph = load("res://Dice/Textures/Narrative_Dice_Symbols/TriumphIcon.tscn")
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
	for i in count:
		grid.add_child(symbol.instance())
