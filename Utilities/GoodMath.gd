

static func vector2_from_points(start_point, end_point):
	var vec_x = end_point.x - start_point.x
	var vec_y = end_point.y - start_point.y
	return Vector2(vec_x, vec_y)

static func vector3_from_points(start_point, end_point):
	var vec_x = end_point.x - start_point.x
	var vec_y = end_point.y - start_point.y
	var vec_z = end_point.z - start_point.z
	return Vector3(vec_x, vec_y, vec_z)

static func flip_vector3(vector):
	return Vector3(-vector.x, -vector.y, -vector.z)

static func flip_vector2(vector):
	return Vector2(-vector.x, -vector.y)