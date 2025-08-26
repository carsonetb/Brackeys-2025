class_name Room
extends Node2D

func _on_level_area_area_entered(area: Area2D) -> void:
	if area.name != "DetectionArea":
		return
	for gate: Gate in $Gates.get_children():
		gate.open()
