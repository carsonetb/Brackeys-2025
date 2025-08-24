class_name DialogComponent
extends Area2D

@export var states: Dictionary[String, String]
@export var current_state: String

var interactable: bool = true

signal this_timeline_started
signal this_timeline_ended

## Triggers dialog.
func interact() -> void:
	if !interactable:
		return
	
	this_timeline_started.emit()
	Dialogic.start("res://dialog/timelines/" + states[current_state] + ".dtl")
	await Dialogic.timeline_ended
	this_timeline_ended.emit()
