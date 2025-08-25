class_name InventorySlot
extends Button

var item: Item = null

func set_item(new_item: Item) -> void:
	item = new_item
	text = item.item_name
	tooltip_text = item.description


func remove_item() -> void:
	item = null
	text = ""
	tooltip_text = ""
