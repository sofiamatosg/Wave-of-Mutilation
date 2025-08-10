extends Sprite2D

var actual_frame
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	Signals.Start.connect(Start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Start():
	self.frame = randi_range(4,7)
