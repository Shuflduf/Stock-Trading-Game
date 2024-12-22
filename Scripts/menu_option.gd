@tool
class_name MenuOption
extends Control

signal selected

@export var item_name: String:
	set(value):
		item_name = value
		%Label.text = value

@export var target_scene: PackedScene

func minimize(time: float):
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(%Label, ^"text", "", time)

func expand(time: float):
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(%Label, ^"text", item_name, time)

func deselect():
	%TextureRect.material.set_shader_parameter("inner_radius", 0.8)

func select():
	%TextureRect.material.set_shader_parameter("inner_radius", 0.0)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_LEFT:
				selected.emit()
