extends AudioStreamPlayer2D


func _on_finished() -> void:
	stream_paused = false
	play()
