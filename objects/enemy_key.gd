extends Sprite2D

var actual_frame
var flag
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	Signals.Start.connect(Start)
	Signals.Yellow.connect(Yellow)
	Signals.Blue.connect(Blue)
	Signals.Green.connect(Green)
	Signals.Yellow.connect(Green)
func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Start():
	self.frame = randi_range(4,7)
	
