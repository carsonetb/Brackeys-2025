class_name RoomChange
extends Node2D

enum Type {
	ENTRANCE,
	EXIT,
}

enum Direction {
	LEFT,
	RIGHT,
	UP,
	DOWN,
}

@export var type: Type
@export var direction: Direction
@export var width: int
