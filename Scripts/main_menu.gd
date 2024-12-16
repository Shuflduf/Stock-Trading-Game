extends Control

signal go_to_game

func _on_button_pressed() -> void:
	go_to_game.emit()
