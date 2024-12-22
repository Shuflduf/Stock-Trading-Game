extends Control

signal stocks_updated

@export var stocks_list: StocksList

var current_stocks: Array[StockListingData]

# This is basically how many times 20 seconds has passed
var current_time: int

var money = 200.0

func _ready() -> void:
	for i in 50:
		_on_update_timer_timeout()

func _on_update_timer_timeout() -> void:
	current_time += 1
	for i in stocks_list.stocks:
		var target_price = i.initial_price * i.demand
		var dir = target_price - i.price

		# If the price is close to the target price, add a small random fluctuation
		if abs(dir) < 0.01:
			var fluctuation = randf_range(-0.1, 0.1)
			i.price += fluctuation
		else:
			var adjustment = dir * randf_range(-0.3, 0.5)
			i.price += adjustment

	stocks_updated.emit()
