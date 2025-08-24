class_name Guard
extends CharacterBody2D


enum STATE {
	PATROL,
}

const PATROL_SPEED: float = 70.0

@export var patrol_line: Line2D

var state : STATE

@onready var patrol_movement: Node2D = $"PatrolMovement"
@onready var vision_cone: Area2D = $"VisionCone"

func _ready() -> void:
	patrol_movement.patrol_points = patrol_line.get_points()
	patrol_movement.point_count = patrol_line.get_point_count()
	state = STATE.PATROL


func _physics_process(delta: float) -> void:
	move_and_slide()
	if state == STATE.PATROL:
		velocity = lerp(velocity, PATROL_SPEED * patrol_movement.get_patrol_vector(), 0.03)
		vision_cone.global_rotation = velocity.angle()
