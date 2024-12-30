extends Node2D

@onready var dialogue = $Control/CharacterDialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.prep_next_level.connect(next_level)
	
	dialogue.variables["mango"] = Globals.has_mango
	dialogue.variables["watch"] = Globals.has_watch

func next_level():
	pass

func _on_pilot_pressed() -> void:
	dialogue.start("Pilot")


func _on_character_dialogue_dialogue_signal(value: String) -> void:
	match value:
		"remove_watch":
			Globals.gold_watch.emit(false)
