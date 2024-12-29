extends Node2D

@onready var dialogue = $Control/CharacterDialogue

func _on_zac_pressed() -> void:
	print("IM ZAC")
	dialogue.start("Zac")


func _on_character_dialogue_dialogue_signal(value: String) -> void:
	pass
	match value:
		'timeskip':
			print("TIMESKIP")
			Globals.sub_time.emit(40)
		'ticket_normal':
			Globals.sub_cash.emit(70)
		'ticket_discount':
			Globals.sub_cash.emit(30)
