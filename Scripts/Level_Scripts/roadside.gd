extends Node2D

@onready var start_fade = $Control/StartFade
@onready var bus_fade = $Control/BusFade
@onready var nyc_fade = $Control/NYCFade
@onready var car_fade = $Control/CarFade
@onready var dialogue = $Control/CharacterDialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_fade.fade_in()
	await start_fade.fade_finished
	start_fade.visible = false


func bus_scene():
	bus_fade.fade_out()
	await bus_fade.next_pressed
	
	nyc_fade.fade_out()
	await nyc_fade.next_pressed
	
	Globals.change_level.emit(5)

func car_scene():
	car_fade.fade_out()
	await car_fade.fade_finished
	
	Globals.change_level.emit(4)

func _on_bus_stop_pressed() -> void:
	print("bus stop")
	dialogue.start("BusStop")

func _on_car_pressed() -> void:
	print("car pressed")
	dialogue.start("Car")

func _on_character_dialogue_dialogue_signal(value: String) -> void:
	print("roadside value: " + value)
	
	match value:
		"catch_bus":
			bus_scene()
		"catch_car":
			car_scene()
