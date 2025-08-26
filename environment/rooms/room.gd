class_name Room
extends Node2D

func _ready() -> void:
	$SizeRect.visible = false
	for gate: Gate in $Gates.get_children():
		gate.open()
