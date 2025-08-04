extends ProgressBar

var parent
var min_value_amount
var max_value_amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	min_value_amount = parent.min_health
	max_value_amount = parent.max_health
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(parent.health)
	if parent.health != max_value_amount:
		self.visible = true
		if parent.health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
