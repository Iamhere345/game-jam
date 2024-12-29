extends Control

@onready var play: Button = $Play
@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_play_pressed() -> void:
	play.visible = false
	
	anim_player.play("fade_to_intro")


func _on_next_pressed() -> void:
	Globals.change_level.emit(1)
