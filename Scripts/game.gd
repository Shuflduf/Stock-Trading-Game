extends Control

signal stocks_updated

@export var stocks_list: StocksList

var current_stocks: Dictionary = {}
# This is basically how many times 20 seconds has passed
var current_time: int

func _ready() -> void:
    for i in 50:
        $UpdateTimer.timeout.emit()

func _on_update_timer_timeout() -> void:
    current_time += 1
    for i in stocks_list.stocks:
        var target_price = i.initial_price * i.demand
        var new_price = (i.history[-1] * 0.2 * randf_range(0.8, 1.2)) + (target_price)
        i.price = new_price
    stocks_updated.emit()
