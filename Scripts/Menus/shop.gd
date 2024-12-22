extends DefaultMenu

@export var trade_listing: PackedScene

func _ready() -> void:
	for i in main_game.stocks_list.stocks:
		%StockOptions.add_item(i.abbreviation)

	for i in main_game.current_stocks:
		create_trade_listing(i)

	main_game.stocks_updated.connect(_on_tick)
	_on_shares_amount_value_changed(0.0)


func _on_place_order_pressed() -> void:
	var new_trade = StockListingData.new()
	new_trade.amount = int(%SharesAmount.value)
	new_trade.name = %StockOptions.get_item_text(%StockOptions.get_selected_id())
	new_trade.original_price = main_game.stocks_list.stocks.filter(func(stock): return new_trade.name == stock.abbreviation)[0].price
	create_trade_listing(new_trade)
	main_game.current_stocks.append(new_trade)

	main_game.stocks_list.stocks.filter(func(stock): return new_trade.name == stock.abbreviation)[0].demand += (%SharesAmount.value / 50)

func create_trade_listing(data: StockListingData):
	var new_trade = trade_listing.instantiate()
	%VBoxContainer.add_child(new_trade)
	new_trade.stock_name = data.name
	new_trade.shares_amount = data.amount
	new_trade.original_price = data.original_price
	new_trade.current_price = data.original_price
	new_trade.call_deferred(&"_update_label")



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
