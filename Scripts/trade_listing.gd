class_name TradeListing
extends PanelContainer

signal sold

@export var stock_name: String
@export var shares_amount: int
@export var original_price: float
@export var current_price: float

var id: int

func _update_label():
	%Content.text = stock_name + " x " + str(shares_amount)

	var difference = current_price - original_price
	var bbcode_start = "[color=" + ("red" if difference < 0 else "green") + "]"
	%SellPrice.text = bbcode_start + "$" + str(current_price * shares_amount).pad_decimals(2)
	%Profit.text = bbcode_start + "(" + ("+" if difference > 0 else "") + str(difference * shares_amount).pad_decimals(2) + ")"

	%SellPrice.tooltip_text = "Original: " + str(original_price).pad_decimals(2)


func _on_sell_pressed() -> void:
	sold.emit()
