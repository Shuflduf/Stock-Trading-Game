@tool
class_name MenuOption
extends HBoxContainer

@export var item_name: String:
	set(value):
		item_name = value
		$Label.text = value

func minimize(time: float):
	var tween = get_tree().create_tween()
	tween.tween_property($Label, ^"text", "", time)

func expand(time: float):
	var tween = get_tree().create_tween()
	tween.tween_property($Label, ^"text", item_name, time)
