extends Node2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("button_left"):
		Signals.Yellow.emit()

	if Input.is_action_just_pressed("button_down"):
		Signals.Blue.emit()
	
	if Input.is_action_just_pressed("button_up"):
		Signals.Green.emit()		
	
	if Input.is_action_just_pressed("button_right"):
		Signals.Pink.emit()
