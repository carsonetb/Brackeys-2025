class_name Inventory
extends Node2D

signal item_selected(item: Item)

@export var num_slots: int = 4


var selected_slot: int = -1


@onready var slots: Array[InventorySlot] = [
	$"InventorySlot1",
	$"InventorySlot2",
	$"InventorySlot3",
	$"InventorySlot4",
]
@onready var inventory_slot: PackedScene = preload("res://ui/inventory_slot.tscn")
@onready var slot_texture: Texture2D = preload("res://art/biscuintory_slot.png")
@onready var aasdf: Texture2D = preload("uid://dli42btswes40")


func _ready() -> void:
	var skib: Item = Item.new()
	skib.ui_sprite = aasdf
	skib.description = "big boy"
	add_item(skib)


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("slot_1"):
		if selected_slot != 0:
			change_selection(0)
			selected_slot = 0
	elif Input.is_action_just_pressed("slot_2"):
		if selected_slot != 1:
			change_selection(1)
			selected_slot = 1
	elif Input.is_action_just_pressed("slot_3"):
		if selected_slot != 2:
			change_selection(2)
			selected_slot = 2
	elif Input.is_action_just_pressed("slot_4"):
		if selected_slot != 3:
			change_selection(3)
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


func change_selection(index: int) -> void:
	if selected_slot != -1:
		slots[selected_slot].modulate.a = 0.5
		slots[selected_slot].selected = false
	
	if slots[index].item != null:
		item_selected.emit(slots[index].item)
	slots[index].modulate.a = 1
	slots[index].selected = true
