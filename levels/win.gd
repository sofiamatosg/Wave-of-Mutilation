extends Node

@onready var win_panel: Panel = $WinPanel
@onready var restart_button: Button = $WinPanel/RestartButton
@onready var exit_button: Button = $WinPanel/ExitButton
@onready var back_win_panel: Panel = %BackWinPanel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_win_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	Signals.Win.connect(Win)
	win_panel.hide()
	back_win_panel.hide()
func Win():
	get_tree().paused = true
	win_panel.show()
	back_win_panel.show()
	
func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	win_panel.hide()
	back_win_panel.hide()
	get_tree().change_scene_to_file("res://levels/main.tscn")


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	win_panel.hide()
	back_win_panel.hide()
	get_tree().reload_current_scene()
