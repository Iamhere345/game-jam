extends Control

signal fade_finished
signal next_pressed

@export var show_next: bool = false
@export var sfx: AudioStreamPlayer = null

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	$Next.visible = show_next

func fade_in():
	visible = true
	anim_player.play("fade_in")
	play_sound()

func fade_out():
	visible = true
	anim_player.play_backwards("fade_in")
	play_sound()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	fade_finished.emit()

func play_sound():
	if sfx:
		sfx.play()

func _on_next_pressed() -> void:
	print("PLEASE WORK PLEASE PLEASE PLEASE WORK")
	next_pressed.emit()
