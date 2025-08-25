class_name Inventory

extends Node2D


@export var num_slots: int = 3

var slots: Array[InventorySlot] = []

@onready var hotbar: GridContainer = $"Hotbar"


func _ready() -> void:
	hotbar.columns = num_slots
	
	for i in range(num_slots):
		var slot = InventorySlot.new()
		hotbar.add_child(slot)
		slots.append(slot)
	
	var item = Item.new()
	item.item_name = "Cat"
	item.description = "A cat"
	add_item(item)


# Returns true if item was added to an empty slot, false if inventory full
func add_item(item: Item) -> bool:
	for i in range(slots.size()):
		if slots[i].item == null:
			slots[i].set_item(item)
			return true
	return false
