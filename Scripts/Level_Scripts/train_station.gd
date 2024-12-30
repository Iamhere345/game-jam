extends Node2D

@onready var dialogue = $Control/CharacterDialogue
@onready var transition = $Control/Transition
@onready var start_fade = $Control/StartFade
@onready var end_fade = $Control/EndFade

func _ready() -> void:
	Globals.prep_next_level.connect(next_level)
	start_fade.fade_in()
	await start_fade.fade_finished
	start_fade.visible = false
	pass

func _on_zac_pressed() -> void:
	print("IM ZAC")
	dialogue.start("Zac")

func _on_character_dialogue_dialogue_signal(value: String) -> void:
	print("value: " + value)
	
	match value:
		'mango':
			Globals.mango.emit(true)

func next_level():
	print("prep next lvl")
	end_fade.fade_out()
	
	await end_fade.next_pressed
	
	Globals.change_level.emit(3)
