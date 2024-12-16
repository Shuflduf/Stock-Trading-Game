extends Control

const MAIN_GAME = preload("res://Scenes/game.tscn")

func _ready() -> void:
	$CRTOverlay.move_to_front()
	$CheckButton.move_to_front()


func _on_main_menu_go_to_game() -> void:
	add_child(MAIN_GAME.instantiate())
	$MainMenu.queue_free()
	$CheckButton.queue_free()
	$CRTOverlay.move_to_front()

func _on_check_button_toggled(toggled_on: bool) -> void:
	$CRTOverlay.material.set_shader_parameter(&"pixelate", !toggled_on)
