extends PanelContainer

@export var stock: Stock:
	set(value):
		stock = value
		%Name.text = value.name
		%Abbreviation.text = value.abbreviation
