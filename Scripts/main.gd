extends Control

const MAIN_MENU = preload("res://Scenes/main_menu.tscn")

func _ready() -> void:
    add_child(MAIN_MENU.instantiate())
    $CRTOverlay.move_to_front()
