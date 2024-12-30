extends Node2D

@onready var forward_tex = load("res://Assets/Characters/driver.png")
@onready var back_tex = load("res://Assets/Characters/dangerous_driver.png")
@onready var driver = $Control/Driver
@onready var dialogue = $Control/CharacterDialogue
@onready var fade = $Control/Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.prep_next_level.connect(next_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_dialogue_dialogue_signal(value: String) -> void:
	print("hitchhike value: " + value)
	
	match value:
		"forward":
			driver.texture_normal = forward_tex
		"back":
			driver.texture_normal = back_tex


func _on_driver_pressed() -> void:
	dialogue.start("Driver")

func next_level():
	fade.fade_out()
	await fade.next_pressed
	
	Globals.change_level.emit(5)
