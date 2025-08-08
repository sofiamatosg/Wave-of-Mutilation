extends Node

var original_scale = Vector2.ONE

func _ready():
	original_scale = %PlayButton.scale

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/game_level.tscn")

func _on_play_button_mouse_entered() -> void:
	%PlayButton.scale = Vector2(1.15, 1.15)

func _on_play_button_mouse_exited() -> void:
	%PlayButton.scale = original_scale
