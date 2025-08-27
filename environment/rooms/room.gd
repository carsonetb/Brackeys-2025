class_name Room
extends Node2D

@onready var player: Player = get_parent().player

func _process(delta: float) -> void:
	if !player:
		player = get_parent().player

func _on_level_area_area_entered(area: Area2D) -> void:
	if area.name != "DetectionArea":
		return
	for gate: Gate in $Gates.get_children():
		gate.open()
