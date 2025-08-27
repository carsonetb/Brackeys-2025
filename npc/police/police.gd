class_name Police
extends CharacterBody2D

@export var weapon_scene: PackedScene
@export var bullet_scene: PackedScene

@onready var player: Player = get_parent().player
@onready var player_raycast: RayCast2D = $PlayerRaycast

var weapon: Weapon

func _ready() -> void:
	if !weapon_scene:
		return
	weapon = weapon_scene.instantiate()
	if !weapon:
		return
	add_child(weapon)

func _process(delta: float) -> void:
	if !player:
		player = get_parent().player
		return
	if !weapon:
		return
		
	player_raycast.target_position = to_local(player.global_position)
	player_raycast.add_exception(player)
	
	weapon.active = true
	if !player_raycast.is_colliding():
		weapon.point_towards(player.global_position, true)
		weapon.use_weapon()
