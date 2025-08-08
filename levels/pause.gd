extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var pause_button: Button = %PauseButton
@onready var back_panel: Panel = %BackPanel
@onready var options_panel: Panel = $OptionsPanel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	pause_panel.show()
	back_panel.show()
	pause_button.hide()
	

func _on_continue_button_pressed() -> void:
	print("a")
	pause_panel.hide()
	back_panel.hide()
	pause_button.show()
	get_tree().paused = false


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()
	back_panel.hide()
	pause_button.show()	
	get_tree().change_scene_to_file("res://levels/main.tscn")


func _on_options_button_pressed() -> void:
	get_tree().paused = true
	pause_panel.hide()
	back_panel.show()
	pause_button.hide()
	options_panel.show()

func _on_back_button_pressed() -> void:
	get_tree().paused = true
	pause_panel.show()
	back_panel.show()
	pause_button.hide()
	options_panel.hide()	
