class_name Bullet
extends Area2D

var direction: Vector2
var speed: float
var shooter: Node

func _process(delta: float) -> void:
	position += direction * speed * delta
	rotation = direction.angle()
	
	if get_overlapping_bodies().size() > 0 && !shooter in get_overlapping_bodies():
		queue_free()

func shoot(dir: Vector2, vel: float, from: Node) -> void:
	direction = dir
	speed = vel
	shooter = from
