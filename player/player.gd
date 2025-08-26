extends CharacterBody2D

## Pixels per second
@export var speed: float 

@onready var detection_area: Area2D = $DetectionArea

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
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

func _on_inventory_item_selected(item: Item) -> void:
	for child: Node2D in $Items.get_children():
		if "active" in child:
			child.active = false
	if !item:
		return
	var node: Node2D = get_node_or_null("Items/" + item.item_name)
	if !node:
		print("Item with name " + item.item_name + " doesn't exist.")
		return
	node.active = true
