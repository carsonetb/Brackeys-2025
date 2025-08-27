class_name Gun 
extends Weapon

func _process(_delta: float) -> void:
	if !active:
		visible = false
		return
	else:
		visible = true
	
	if abs(rad_to_deg(rotation)) < 90 || abs(rad_to_deg(rotation)) > 270:
		scale.y = 1
	else:
		scale.y = -1

func point_towards(pos: Vector2, smoothing_enabled: bool = false) -> void:
	var target: float = global_position.direction_to(pos).angle() - PI
	if !smoothing_enabled:
		rotation = target
	rotation += angle_difference(rotation, target) * 0.05
	if rotation < 0:
		rotation += TAU
	if rotation > TAU:
		rotation -= TAU

func use_weapon() -> void:
	pass
