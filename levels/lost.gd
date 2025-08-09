extends Node

@onready var lost_panel: Panel = $LostPanel
@onready var restart_button: Button = $LostPanel/RestartButton
@onready var exit_button: Button = $LostPanel/ExitButton
@onready var back_lost_panel: Panel = %BackLostPanel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_lost_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	Signals.Lost.connect(Lost)

func Lost():
	get_tree().paused = true
	lost_panel.show()
	back_lost_panel.show()
	
func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	lost_panel.hide()
	back_lost_panel.hide()
	get_tree().change_scene_to_file("res://levels/main.tscn")


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	lost_panel.hide()
	back_lost_panel.hide()
	get_tree().reload_current_scene()
