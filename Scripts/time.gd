extends Label

@export var time_left: int = 10 * 60

@onready var min: Timer = $Minute
@onready var sec: Timer = $Second

var seperator: String = ":"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.sub_time.connect(sub_time)
	Globals.set_time.connect(set_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func parse_time() -> String:
	return "%d%s%02d" % [time_left / 60, seperator, time_left % 60]

func sub_time(amount: int):
	time_left -= amount
	if time_left <= 0:
		Globals.game_over.emit("The last boat for the South Pole, and had nowhere to go.")

func set_time(time: int):
	time_left = time

func _on_minute_timeout() -> void:
	sub_time(1)
	text = parse_time()
	min.start()

func _on_second_timeout() -> void:
	if seperator == ":":
		seperator = " "
	elif seperator == " ":
		seperator = ":"
		
	text = parse_time()
	sec.start()
