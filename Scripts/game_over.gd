extends Control

@onready var body = $Body
@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	Globals.game_over.connect(game_over)

func game_over(text: String):
	print("GAME OVER MAN")
	
	body.text = text
	
	visible = true
	
	anim_player.play("fade_background")
	await anim_player.animation_finished
	get_parent().current_level.queue_free()
	anim_player.play("fade_info")

func _on_play_again_pressed() -> void:
	print("reloading scene")
	get_tree().reload_current_scene()
