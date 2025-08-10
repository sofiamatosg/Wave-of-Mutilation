extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var pause_button: Button = %PauseButton
@onready var back_panel: Panel = %BackPanel
@onready var options_panel: Panel = $OptionsPanel
@onready var music_symbol: Sprite2D = %MusicSymbol
@onready var music_slider: HSlider = %MusicSlider
@onready var sfx_symbol: Sprite2D = %SFXSymbol
@onready var sfx_slider: HSlider = %SFXSlider





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	music_symbol.hframes = 2
	sfx_symbol.hframes = 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if music_slider.value <= 0.01:
		music_symbol.hframes = 3
		print("o")
	else:
		music_symbol.hframes = 2
	
	if sfx_slider.value <= 0.01:
		sfx_symbol.hframes = 3
	else:
		sfx_symbol.hframes = 2

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


func _on_next_button_pressed() -> void:
	pass # Replace with function body.
