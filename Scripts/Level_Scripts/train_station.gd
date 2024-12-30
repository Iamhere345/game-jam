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
	pass
	match value:
		'timeskip':
			print("TIMESKIP")
			Globals.sub_time.emit(40)
		'ticket_normal':
			Globals.sub_cash.emit(70)
		'ticket_discount':
			Globals.sub_cash.emit(30)

func next_level():
	end_fade.fade_out()
	
	await end_fade.next_pressed
	
	Globals.change_level.emit(3)
