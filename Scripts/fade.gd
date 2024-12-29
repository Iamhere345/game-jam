extends Control

signal fade_finished

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func fade_in():
	visible = true
	anim_player.play("fade_in")

func fade_out():
	visible = true
	anim_player.play_backwards("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	fade_finished.emit()
