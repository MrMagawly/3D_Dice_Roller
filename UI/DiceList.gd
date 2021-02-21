extends PanelContainer

signal dice_spawn_button_pressed

var regular_dice
var narrative_dice
var fate_dice

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	regular_dice = {"D4":0,"D6":0,"D8":0,"D10":0,"D12":0,"D20":0,"D100":0}
	narrative_dice = {"Boost":0,"Ability":0,"Proficiency":0,"Setback":0,"Difficulty":0,"Challenge":0,"Force":0}
	fate_dice = 0



func _on_DiceListButton_pressed():
	if visible:
		visible = false
	else:
		visible = true

#TODO: Make sure spinbox numbers get reset to zero when the dice_spawn_button is pressed.
func _on_DiceSpawnButton_pressed():
	emit_signal("dice_spawn_button_pressed", regular_dice, narrative_dice, fate_dice)



func _on_D4SpinBox_value_changed(value):
	regular_dice.D4 = int(value)


func _on_D6SpinBox_value_changed(value):
	regular_dice.D6 = int(value)


func _on_D8SpinBox_value_changed(value):
	regular_dice.D8 = int(value)


func _on_D10SpinBox_value_changed(value):
	regular_dice.D10 = int(value)


func _on_D12SpinBox_value_changed(value):
	regular_dice.D12 = int(value)


func _on_D20SpinBox_value_changed(value):
	regular_dice.D20 = int(value)


func _on_D100SpinBox_value_changed(value):
	regular_dice.D100 = int(value)


func _on_BoostSpinBox_value_changed(value):
	narrative_dice.Boost = int(value)


func _on_AbilitySpinBox_value_changed(value):
	narrative_dice.Ability = int(value)


func _on_Proficiency_value_changed(value):
	narrative_dice.Proficiency = int(value)


func _on_SetbackSpinBox_value_changed(value):
	narrative_dice.Setback = int(value)


func _on_DifficultySpinBox_value_changed(value):
	narrative_dice.Difficulty = int(value)


func _on_ChallengeSpinBox_value_changed(value):
	narrative_dice.Challenge = int(value)


func _on_ForceSpinBox_value_changed(value):
	narrative_dice.Force = int(value)


func _on_FateSpinBox_value_changed(value):
	fate_dice = int(value)

