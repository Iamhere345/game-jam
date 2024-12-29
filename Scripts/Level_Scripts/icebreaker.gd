extends Node2D

@onready var dialogue = $Control/CharacterDialogue

func _on_ron_swanson_pressed() -> void:
	dialogue.start("Ron")
