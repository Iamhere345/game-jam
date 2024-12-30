extends Node2D

@onready var dialogue = $Control/CharacterDialogue
@onready var fade = $Control/Fade
@onready var transition = $Control/Transition
@onready var transition2 = $Control/Transition2

func _ready() -> void:
	Globals.prep_next_level.connect(next_level)
	fade.fade_in()

func _on_ron_swanson_pressed() -> void:
	dialogue.start("Ron")

func next_level():
	transition.fade_out()
	await transition.next_pressed
	
	transition2.fade_out()
	await transition2.fade_finished
	transition.visible = false
	await transition2.next_pressed
		
	Globals.change_level.emit(2)

func _on_character_dialogue_dialogue_signal(value: String) -> void:
	print("value: " + value)
	
	match value:
		'gold_watch':
			print("GOLD WATCH DIALOGUE")
			Globals.gold_watch.emit(true)
		'mango':
			Globals.mango.emit(true)
