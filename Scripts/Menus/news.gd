extends DefaultMenu

@export var news_item: PackedScene

func _ready() -> void:
	main_game.stocks_updated.connect(tick)

func tick():
	if randi_range(0, 5) == 0:
		make_new_item()

func make_new_item():
	var stock_abr: String = main_game.stocks_list.stocks.pick_random().abbreviation
	var stock_full_legal_name = main_game.stocks_list.stocks.filter(func(s): return stock_abr == s.abbreviation)[0].name
	var difference = randf_range(0.4, 2.4)
	var going_up = difference > 1
	var item = news_item.instantiate()

	item.title = stock_abr + " is going " + ("UP!" if going_up else "DOWN!")
	item.description = """
The stock "%s", also known as "%s", is expected to change by %d percent.
	""" % [stock_full_legal_name, stock_abr, difference * 100.0]
	%VBoxContainer.add_child(item)
	%VBoxContainer.move_child(item, 0)

	main_game.stocks_list.stocks.filter(func(s): return stock_abr == s.abbreviation)[0].demand *= difference
