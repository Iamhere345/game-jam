extends Node2D

@export var dialogue: DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue.dialogue_signal.connect(on_signal)

func on_signal(value: String):
	var cmd: String = value.split(" ")[0]
	var arg: String
	if value.split(" ").size() >= 1: 
		arg = value.split(" ")[1]
	
	match cmd:
		'set_time':
			Globals.set_time.emit(int(arg))
		'sub_time':
			Globals.sub_time.emit(int(arg))
		'set_cash':
			Globals.set_cash.emit(int(arg))
		'add_cash':
			Globals.add_cash.emit(int(arg))
		'sub_cash':
			Globals.sub_cash.emit(int(arg))
		'game_over':
			Globals.game_over.emit(value.split(" ", true, 1))
