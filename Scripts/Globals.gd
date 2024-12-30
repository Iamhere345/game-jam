extends Node2D

signal change_level(new_level: int)
signal hud_visible(hide: bool)

signal sub_time(amount: int)
signal set_time(time: int)

signal set_cash(new_cash: int)
signal add_cash(amount: int)
signal sub_cash(amount: int)

signal game_over(text: String)
signal prep_next_level

signal gold_watch(give: bool)
signal mango(give: bool)

@export var current_level: int = 0
@export var has_watch: bool = false
@export var has_mango: bool = false
@export var cash: int = 0

func _ready() -> void:
	gold_watch.connect(func(give):
		has_watch = give
	)
	mango.connect(func(give):
		has_mango = give
	)
