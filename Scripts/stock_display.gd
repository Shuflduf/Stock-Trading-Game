@tool
class_name StockDisplay
extends PanelContainer

@export var stock: Stock:
    set(value):
        stock = value
        %Name.text = value.name
        %Abbreviation.text = value.abbreviation

@export var selected = false:
    set(value):
        selected = value
        custom_minimum_size = Vector2(800, 800) if value else Vector2.ZERO
        %Extras.visible = value
