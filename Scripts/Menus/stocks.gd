extends DefaultMenu

const STOCK = preload("res://Scenes/stock.tscn")

func _ready() -> void:
	for i: Stock in main_game.stocks_list.stocks:
		var stock_display = STOCK.instantiate()
		stock_display.stock = i
		stock_display.gui_input.connect(
			stock_display_gui_input.bind(stock_display)
		)
		%Stocks.add_child(stock_display)

func stock_display_gui_input(input: InputEvent, display: Control):
	if input is InputEventMouseButton:
		if input.is_pressed():
			if input.button_index == MOUSE_BUTTON_LEFT:
				if display.get_index() % 2 != 0:
					%Stocks.move_child(display, display.get_index() + 1)
				for i in %Stocks.get_children():
					i.selected = false
				display.selected = true
