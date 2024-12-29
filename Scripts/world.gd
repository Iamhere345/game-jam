extends Node2D

@onready var hud: Control = $Hud

@export var current_level_index: int = 0
var current_level: Node

func _ready() -> void:
	change_level(1)
	Globals.change_level.connect(change_level)
	Globals.hud_visible.connect(hide_hud)

func change_level(index: Variant) -> void:
	
	print("changing level")
	
	# unload the current level if it exists
	if current_level:
		current_level.queue_free()
		current_level = null
	
	print("res://Assets/Scenes/Levels/level_" + str(index) + ".tscn")
	
	var new_level_tscn: PackedScene = load("res://Scenes/Levels/level_" + str(index) + ".tscn")
	
	current_level = new_level_tscn.instantiate()
	call_deferred("add_child", current_level)
	
	await current_level.ready
	
	current_level_index = index

func hide_hud(hide: bool):
	hud.visible = !hide
