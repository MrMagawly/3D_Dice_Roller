extends Camera

var ray_length
var mouse_pos
var space_state
var result
var from
var to
var can_cast_ray

func _ready():
	can_cast_ray = false
	ray_length = 1000

func _physics_process(delta):
	process_input()
	if can_cast_ray:
		cast_ray_from_mouse_pos()

func process_input():
	if Input.is_action_just_pressed("select_action"):
		can_cast_ray = true
	if Input.is_action_just_released("select_action"):
		can_cast_ray = false
		get_tree().call_group("G_Dice","player_stopped_turning_dice")

func cast_ray_from_mouse_pos():
	mouse_pos = get_viewport().get_mouse_position()
	from = project_ray_origin(mouse_pos)
	to = from + project_ray_normal(mouse_pos) * ray_length
	space_state = get_world().direct_space_state
	result = space_state.intersect_ray(from, to, [self], 2)
	if result:
		get_tree().call_group("G_Dice","player_turning_dice", result.position)
	result = space_state.intersect_ray(from, to, [self], 4)
	if result:
		if result.collider.is_in_group("G_Dice"):
			get_tree().call_group("G_Dice", "awaken_dice")