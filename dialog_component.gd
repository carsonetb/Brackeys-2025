class_name DialogComponent
extends Area2D

@export var states: Dictionary[String, Conversation]
@export var current_state: String

var interactable: bool = true

## Triggers dialog.
func interact() -> void:
	if !interactable:
		return
	
	var this_conversation: Conversation = states[current_state]
	Dialogic.start("res://dialog/timelines/" + this_conversation.timeline_name + ".dtl")
	await Dialogic.timeline_ended
	
	if this_conversation.next_state == "end":
		interactable = false
		return
	current_state = this_conversation.next_state
