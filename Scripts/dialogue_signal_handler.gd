extends Node2D

@export var dialogue: DialogueBox

@onready var talk_sound = $TalkingSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue.dialogue_signal.connect(on_signal)
	dialogue.wait_ended.connect(func():
		print("stop sound")
		talk_sound.stop()
	)
	dialogue.dialogue_processed.connect(func(speaker: Variant, dialogue: String, options: Array[String]):
		print("play sound")
		talk_sound.play()
	)
	#dialogue.dialogue_started.connect(func():
		#print("dialogue started")
	#)
	#dialogue.dialogue_ended.connect(func():
		#print("dialogue ended")
	#)

func on_signal(value: String):
	var cmd: String = value.split(" ")[0]
	var arg: String
	if value.split(" ").size() > 1: 
		arg = value.split(" ")[1]
	
	print("cmd: " + cmd + " arg: " + str(arg) or "null")
	
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
		'next_level':
			print("next level")
			Globals.prep_next_level.emit()
		'game_over':
			print("game over dialogue: ", value.split(" ", true, 1)[1])
			Globals.game_over.emit(value.split(" ", true, 1)[1])


func _on_talking_sound_finished() -> void:
	talk_sound.stream_paused = false
	talk_sound.play()
