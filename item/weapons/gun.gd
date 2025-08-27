class_name Gun 
extends Weapon

@export var bullet_scene: PackedScene
@export var shoot_cooldown_time: float
@export var shoot_speed: float 

var shoot_cooldown: float = shoot_cooldown_time

func _process(delta: float) -> void:
	if shoot_cooldown > 0:
		shoot_cooldown -= delta
		if shoot_cooldown < 0:
			shoot_cooldown = 0
	
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
	if shoot_cooldown == 0:
		shoot_cooldown = shoot_cooldown_time
		var bullet: Bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.global_position = global_position
		bullet.shoot(Vector2.from_angle(rotation + PI), shoot_speed, get_parent())
