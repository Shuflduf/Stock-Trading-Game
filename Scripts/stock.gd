class_name Stock
extends Resource
## Represents a stock. Shares can be bought and sold, has supply and demand.

## Name of the stock
@export var name: String

## Abbreviation used for the stock, should be UPPERCASE
@export var abbreviation: String

## How many shares are in circulation in the economy
@export var quantity: int

## Starting price of one share. This value will change, and is only set here as a starting point.
@export var price: float

# Used to make graphs and such, each element is 20s apart
var history: Array[float]
