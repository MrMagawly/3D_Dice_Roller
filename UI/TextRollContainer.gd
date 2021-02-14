extends Control

func insert_text(typed_text):
	var label_for_text = Label.new()
	label_for_text.autowrap = true
	label_for_text.text = typed_text
	add_child(label_for_text)

func insert_narrative_result(result):
	var symbol_grid = GridContainer.new()
	var advantage = load("res://Dice/Textures/Narrative_Dice_Symbols/AdvantageIcon.tscn")
	var despair = load("res://Dice/Textures/Narrative_Dice_Symbols/DespairIcon.tscn")
	var failure = load("res://Dice/Textures/Narrative_Dice_Symbols/FailureIcon.tscn")
	var success = load("res://Dice/Textures/Narrative_Dice_Symbols/SuccessIcon.tscn")
	var threat = load("res://Dice/Textures/Narrative_Dice_Symbols/ThreatIcon.tscn")
	var triumph = load("res://Dice/Textures/Narrative_Dice_Symbols/TriumphIcon.tscn")
	var a_count = 0 
	var d_count = 0
	var dr_count = 0
	var f_count = 0
	var l_count = 0
	var s_count = 0
	var th_count = 0
	var tr_count = 0
	symbol_grid.set_columns(7)
	
	var i = 0
	while i < result.length():
		match result.substr(i, 1):
			"A":
				a_count += 1
			"D":
				d_count += 1
			"F":
				f_count += 1
			"S":
				s_count += 1
			"t":
				th_count += 1
			"T":
				tr_count += 1
			"d":
				dr_count += 1
			"L":
				l_count += 1
		i += 1
	
	if s_count > f_count:
		s_count -= f_count
		f_count = 0
	else:
		f_count -= s_count
		s_count = 0
	
	if a_count > th_count:
		a_count -= th_count
		th_count = 0
	else:
		th_count -= a_count
		a_count = 0
	
	while s_count > 0:
		symbol_grid.add_child(success.instance())
		s_count -= 1
	while f_count > 0:
		symbol_grid.add_child(failure.instance())
		f_count -= 1
	while a_count > 0:
		symbol_grid.add_child(advantage.instance())
		a_count -= 1
	while th_count > 0:
		symbol_grid.add_child(threat.instance())
		th_count -= 1
	while tr_count > 0:
		symbol_grid.add_child(triumph.instance())
		tr_count -= 1
	while d_count > 0:
		symbol_grid.add_child(despair.instance())
		d_count -= 1
	
	add_child(symbol_grid)