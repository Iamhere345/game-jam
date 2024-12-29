extends TextureButton

@onready var popup = $Panel

func _on_pressed() -> void:
	popup.visible = true


func _on_close_pressed() -> void:
	popup.visible = false
