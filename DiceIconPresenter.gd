extends GridContainer

# TODO: Make sure the grid container changes the number of columns it has 
# on resize of ChatTerminal.

func _ready():
	set_columns(7)
	var advantage = load("res://Dice/Textures/Narrative_Dice_Symbols/AdvantageIcon.tscn")
	for i in range(10):
		add_child(advantage.instance())