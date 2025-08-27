@abstract 
class_name Weapon
extends Node2D

var active: bool = false

@abstract
func point_towards(pos: Vector2, smoothing_enabled: bool = false) -> void

@abstract
func use_weapon() -> void
