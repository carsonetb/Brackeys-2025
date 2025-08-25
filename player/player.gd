extends CharacterBody2D

## Pixels per second
@export var speed: float 

@onready var detection_area: Area2D = $DetectionArea
@onready var precise_position: Vector2 = position

func _process(delta: float) -> void:
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
	position = precise_position
	move_and_slide()
	precise_position = position
	position = round(position)
