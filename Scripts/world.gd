extends Node2D

@onready var hud: Control = $Hud
@onready var game_over = $GameOver

@export var current_level_index: int = 0
@export var current_level: Node

var has_gold_watch: bool = false

func _ready() -> void:
	change_level(1)
	Globals.change_level.connect(change_level)
	Globals.hud_visible.connect(hide_hud)
	Globals.gold_watch.connect(func(give: bool):
		has_gold_watch = give
	)

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
	Globals.current_level = index

func hide_hud(hide: bool):
	hud.visible = !hide
