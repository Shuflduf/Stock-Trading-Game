extends DefaultMenu

@export var trade_listing: PackedScene

func _ready() -> void:
	for i in main_game.stocks_list.stocks:
		%StockOptions.add_item(i.abbreviation)

	main_game.stocks_updated.connect(_on_tick)
	_on_shares_amount_value_changed(0.0)


func _on_place_order_pressed() -> void:
	var new_trade = trade_listing.instantiate()
	%VBoxContainer.add_child(new_trade)
	new_trade.stock_name = %StockOptions.get_item_text(%StockOptions.get_selected_id())
	new_trade.shares_amount = int(%SharesAmount.value)
	new_trade.original_price = main_game.stocks_list.stocks.filter(func(stock): return new_trade.stock_name == stock.abbreviation)[0].price
	new_trade.current_price = new_trade.original_price
	new_trade.call_deferred(&"_update_label")

	var prev_amount = main_game.current_stocks.get(new_trade.stock_name)
	if prev_amount == null:
		prev_amount = 0
	main_game.current_stocks[new_trade.stock_name] = new_trade.shares_amount + prev_amount
	print(main_game.current_stocks)


func _on_stock_options_item_selected(index: int) -> void:
	var stock_name = %StockOptions.get_item_text(index)
	var price = main_game.stocks_list.stocks.filter(func(stock): return stock_name == stock.abbreviation)[0].price
	%CostLabel.text = "$" + str(price * %SharesAmount.value).pad_decimals(2)


func _on_shares_amount_value_changed(_value: float) -> void:
	_on_stock_options_item_selected(%StockOptions.selected)

func _on_tick():
	_on_shares_amount_value_changed(0.0)

	for i in %VBoxContainer.get_children():
		if i is not TradeListing:
			continue
		i.current_price = main_game.stocks_list.stocks.filter(func(stock): return i.stock_name == stock.abbreviation)[0].price
		i._update_label()
