class_name Gate
extends AnimatableBody2D

func _ready() -> void:
	$Animation.play("close")
	$CollisionShape2D.disabled = true

func open() -> void:
	$Animation.play("open")
	$CollisionShape2D.disabled = false
