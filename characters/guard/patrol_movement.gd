extends Node2D


const POINT_PRECISION: float = 5.0

var patrol_points: PackedVector2Array
var point_count: int
var target_point: int = 1


func get_patrol_vector():
	if (global_position - patrol_points[target_point]).length() < POINT_PRECISION:
		next_point()
	return (patrol_points[target_point] - global_position).normalized()

func next_point():
	if target_point == point_count - 1:
		target_point = 0
	else:
		target_point += 1
