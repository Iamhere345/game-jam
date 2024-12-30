extends Control

@onready var watch_regular = $Watch
@onready var watch_gold = $WatchGold
@onready var mango = $Mango

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.gold_watch.connect(gold_watch)
	Globals.mango.connect(get_mango)

func gold_watch(give: bool):
	print("hud gold watch")
	watch_regular.visible = !give
	watch_gold.visible = give

func get_mango(give: bool):
	mango.visible = give
