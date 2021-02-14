extends Area

var NORMAL_VEC

func _ready():
	NORMAL_VEC = Vector3(0,-1,0)
	gravity_vec = NORMAL_VEC

func replace_area():
	space_override = Area.SPACE_OVERRIDE_REPLACE

func disable_area():
	space_override = Area.SPACE_OVERRIDE_DISABLED

func set_gravity_point(state):
	gravity_point = state

func receive_ray_hit_pos(pos):
	change_gravity_vector(pos.x, -40, pos.z)

func reset_gravity_vec():
	gravity_vec = NORMAL_VEC

func change_gravity_vector(x,y,z):
	gravity_vec = Vector3(x,y,z)