class_name Inventory
extends Node2D


@export var num_slots: int = 4

var slots: Array[InventorySlot] = []
var selected_slot: int = -1

@onready var hotbar: GridContainer = $"Hotbar"


func _ready() -> void:
	hotbar.columns = num_slots
	
	for i in range(num_slots):
		var slot = InventorySlot.new()
		slot.slot_number = i
		hotbar.add_child(slot)
		slot.custom_minimum_size = Vector2(64,64)
		slots.append(slot)


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("slot_1"):
		selected_slot = 0
	elif Input.is_action_just_pressed("slot_2"):
		selected_slot = 1
	elif Input.is_action_just_pressed("slot_3"):
		selected_slot = 2
	elif Input.is_action_just_pressed("slot_4"):
		selected_slot = 3


# Returns true if item was added to an empty slot, false if inventory full
func add_item(item: Item) -> bool:
	for i in range(slots.size()):
		if slots[i].item == null:
			slots[i].set_item(item)
			return true
	return false


func remove_item(index: int) -> void:
	slots[index].remove_item()
	slots[index] = null


func slot_button_pressed(index: int) -> void:
	selected_slot = index
