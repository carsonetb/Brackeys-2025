class_name Gun 
extends Node2D

var active: bool = false

func _process(delta: float) -> void:
	if !active:
		visible = false
		return
	else:
		visible = true
	
	rotation = global_position.direction_to(get_global_mouse_position()).angle() - PI
	if abs(rad_to_deg(rotation)) < 90 || abs(rad_to_deg(rotation)) > 270:
		scale.y = 1
	else:
		scale.y = -1
