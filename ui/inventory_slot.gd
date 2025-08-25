class_name InventorySlot
extends TextureRect


@export var slot_number: int

var item: Item = null
var selected: bool = false

@onready var item_texture: TextureRect = get_node("ItemTexture")


func set_item(new_item: Item) -> void:
	item = new_item
	item_texture.texture = item.ui_sprite
	tooltip_text = item.description

func remove_item() -> void:
	item = null
	item_texture.texture = null
	tooltip_text = ""
