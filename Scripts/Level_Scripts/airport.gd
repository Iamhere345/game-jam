extends Node2D

@onready var dialogue = $Control/CharacterDialogue
@onready var start_fade = $Control/StartFade
@onready var end_fade = $Control/EndFade
@onready var tassie_fade = $Control/TassieFade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_fade.fade_in()
	Globals.prep_next_level.connect(next_level)
	
	dialogue.variables["mango"] = Globals.has_mango
	dialogue.variables["watch"] = Globals.has_watch
	dialogue.variables["cash"] = Globals.cash

func next_level():
	end_fade.fade_out()
	await end_fade.next_pressed
	
	tassie_fade.fade_out()
	await tassie_fade.next_pressed
	
	Globals.change_level.emit(6)

func _on_pilot_pressed() -> void:
	print("pilot")
	dialogue.start("Pilot")


func _on_character_dialogue_dialogue_signal(value: String) -> void:
	match value:
		"remove_watch":
			Globals.gold_watch.emit(false)
