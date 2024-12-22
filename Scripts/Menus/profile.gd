extends DefaultMenu

func _ready() -> void:
	tick()
	main_game.stocks_updated.connect(tick)

func tick():
	%Money.text = "Money: $" + str(main_game.money).pad_decimals(2)
