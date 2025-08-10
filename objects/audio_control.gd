extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout 
	$Drive.play()
	Signals.Lost.connect(Lost)
	Signals.ResetCombo.connect(ResetCombo)
	Signals.Win.connect(Win)
	$Drive.finished.connect(_on_drive_finished)

func Lost():
	$Lose.play()

func ResetCombo():
	$Break.play()
func _on_drive_finished():
	Signals.Win.emit()
	print("winwin")
func Win():
	$Win.play()
