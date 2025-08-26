class_name Gun 
extends Node2D

func _process(delta: float) -> void:
	rotation = global_position.direction_to(get_global_mouse_position()).angle() - PI
	if abs(rad_to_deg(rotation)) < 90 || abs(rad_to_deg(rotation)) > 270:
		scale.y = 1
	else:
		scale.y = -1
