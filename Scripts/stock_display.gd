@tool
class_name StockDisplay
extends PanelContainer

@export var stock: Stock:
	set(value):
		stock = value
		%Name.text = value.name
		%Abbreviation.text = value.abbreviation

@export var selected = false:
	set(value):
		selected = value
		custom_minimum_size = Vector2(800, 600) if value else Vector2(0, 300)
		%Extras.visible = value
		%Basic.size_flags_horizontal = SIZE_SHRINK_BEGIN if value else SIZE_EXPAND_FILL
		%Basic.size_flags_vertical = SIZE_SHRINK_BEGIN if value else SIZE_EXPAND_FILL


func _process(_delta: float) -> void:
	if stock != null:
		%Graph.data = stock.history
		%Graph.queue_redraw()
		
		%PriceLabel.text = "$" + str(stock.price).pad_decimals(2)
