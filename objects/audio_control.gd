extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout  # Wait 3 seconds
	$Drive.play()
	Signals.Lost.connect(Lost)
	Signals.ResetCombo.connect(ResetCombo)
func Lost():
	$Lose.play()

func ResetCombo():
	$Break.play()
