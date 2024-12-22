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


		var adjustment = dir * randf_range(-0.1, 0.2) + randf_range(-0.1, 0.2)
		i.price = clamp(i.price + adjustment, 0, INF)

	stocks_updated.emit()
