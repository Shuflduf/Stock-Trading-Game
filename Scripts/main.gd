extends Control

const MAIN_GAME = preload("res://Scenes/game.tscn")

func _ready() -> void:
    $CRTOverlay.move_to_front()


func _on_main_menu_go_to_game() -> void:
    add_child(MAIN_GAME.instantiate())
    $MainMenu.queue_free()
    $CRTOverlay.move_to_front()
