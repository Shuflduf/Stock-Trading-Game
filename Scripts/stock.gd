class_name Stock
extends Resource
## Represents a stock. Shares can be bought and sold, has supply and demand.

## Name of the stock
@export var name: String

## Abbreviation used for the stock, should be UPPERCASE
@export var abbreviation: String

## How many shares are in circulation in the economy
@export var quantity: int

var _set_price = false
## Starting price of one share. This value will change, and is only set here as a starting point.
@export var price: float:
    set(value):
        price = value
        if !_set_price:
            initial_price = value
            history[0] = value
            _set_price = true
        else:
            history.append(value)

# Used to make graphs and stuff, each element is 20s apart
var history: Array[float] = [0.0]

var demand = 1
var initial_price: float
