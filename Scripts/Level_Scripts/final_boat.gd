extends Node2D

@onready var fade = $Control/Fade
@onready var ending_fade = $Control/Ending
@onready var win = $Win

var scores = ["95280 B+", "11297 A", "138952 A+++", "4227 C", "617 D-"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade.fade_out()
	await fade.fade_finished

func _on_boat_pressed() -> void:
	ending_fade.fade_out()
	await ending_fade.next_pressed
	
	win.game_over("Score: 95280 B+\n Playstyle: Koala")
