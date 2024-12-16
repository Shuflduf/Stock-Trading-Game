@tool
extends PanelContainer

@export var title: String:
	set(value):
		title = value
		%Title.text = value
@export var description: String:
	set(value):
		description = value
		%Description.text = value
