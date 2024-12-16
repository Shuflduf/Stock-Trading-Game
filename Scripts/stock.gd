class_name Stock
extends Resource
## Represents a stock. Can be bought and sold, has supply and demand.

## Name of the stock
@export var name: String

## How much of the stock is in circulation in the economy
@export var quantity: int

## Starting price of one stock. This value will change, and is only set here as a starting point.
@export var price: int
