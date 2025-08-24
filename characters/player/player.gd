extends CharacterBody2D

## Pixels per second
@export var speed: float 

@onready var detection_area: Area2D = $DetectionArea

var precise_position: Vector2

func _process(delta: float) -> void:
	for area: Area2D in detection_area.get_overlapping_areas():
		if area is DialogComponent:
			var dialog_component: DialogComponent = area as DialogComponent
			if Input.is_action_just_pressed("interact"):
				dialog_component.interact()
	
	var direction: Vector2
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	velocity = direction * speed
	move_and_slide()
