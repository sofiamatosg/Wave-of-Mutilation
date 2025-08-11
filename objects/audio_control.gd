extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout 
	if get_tree().current_scene.name == "GameLevel":
		$Drive.play()
	elif get_tree().current_scene.name == "GameLevel2":
		pass
	Signals.Lost.connect(Lost)
	Signals.ResetCombo.connect(ResetCombo)
	Signals.Win.connect(Win)
	Signals.Ocean.connect(Ocean)
	$Drive.finished.connect(_on_drive_finished)
	
	Signals.Yellow.connect(Yellow)
	Signals.Blue.connect(Blue)
	Signals.Green.connect(Green)
	Signals.Pink.connect(Pink)
func Lost():
	$Lose.play()

func ResetCombo():
	$Break.play()
func _on_drive_finished():
	Signals.Win.emit()
	print("winwin")
func Win():
	$Win.play()
	
func Ocean():
	$Ocean.play()
	print("=11=11")
func Yellow():
	$Yellow.play()
func Blue():
	$Blue.play()
func Green():
	$Green.play()
func Pink():
	$Pink.play()
