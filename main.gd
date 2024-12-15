extends Control

const MAIN_MENU = preload("res://main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    add_child(MAIN_MENU.instantiate())
    $CRTOverlay.move_to_front()
