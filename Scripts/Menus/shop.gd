extends DefaultMenu

@export var trade_listing: PackedScene

func _ready() -> void:
	for i in main_game.stocks_list.stocks:
		%StockOptions.add_item(i.abbreviation)


func _on_place_order_pressed() -> void:
	var new_trade = trade_listing.instantiate()
	%VBoxContainer.add_child(new_trade)
	new_trade.stock_name = %StockOptions.get_item_text(%StockOptions.get_selected_id())
	new_trade.shares_amount = int(%SharesAmount.value)
	new_trade.original_price = main_game.stocks_list.stocks.filter(func(stock): return new_trade.stock_name == stock.abbreviation)[0].price
	new_trade.current_price = new_trade.original_price
	new_trade.call_deferred(&"_update_label")
