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

@export var current_level: int = 0
