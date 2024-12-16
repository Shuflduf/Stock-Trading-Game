extends DefaultMenu

const STOCK = preload("res://Scenes/stock.tscn")



func _ready() -> void:
	for i in main_game.stocks.stocks:
		var stock_display = STOCK.instantiate()
		stock_display.stock = i
		$ScrollContainer/VFlowContainer.add_child(stock_display)
