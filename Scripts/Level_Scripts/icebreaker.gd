extends Node2D

@onready var dialogue = $Control/CharacterDialogue
@onready var fade = $Control/Fade

func _ready() -> void:
	Globals.prep_next_level.connect(next_level)
	fade.fade_in()

func _on_ron_swanson_pressed() -> void:
	dialogue.start("Ron")

func next_level():
	fade.fade_out()
	await fade.fade_finished
	
	Globals.change_level.emit(2)
