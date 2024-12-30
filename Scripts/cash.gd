extends Label

@export var cash: int = 500

func _ready() -> void:
	Globals.set_cash.connect(set_cash)
	Globals.add_cash.connect(add_cash)
	Globals.sub_cash.connect(sub_cash)
	
	update_ui()

func update_ui():
	text = str(cash)
	Globals.cash = cash

func set_cash(new_cash: int):
	cash = new_cash
	update_ui()

func add_cash(amount: int):
	cash += amount
	update_ui()

func sub_cash(amount: int):
	print("cash -= " + str(amount))
	cash -= amount
	update_ui()
