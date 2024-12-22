extends DefaultMenu

func _ready() -> void:
	main_game.stocks_updated.connect(tick)

func tick():
	%Money.text = "Money: $" + str(main_game.money)
