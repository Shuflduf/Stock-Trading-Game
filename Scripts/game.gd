extends Control

@export var stocks_list: StocksList

# This is basically how many times 20 seconds has passed
var current_time: int


func _on_update_timer_timeout() -> void:
	for i in stocks_list.stocks:
		i.history.append(randf_range(0, 5.0))
