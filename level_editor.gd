extends Node2D

const in_edit_mode: bool = false
var current_level_name = "Intro"

var level_info = {
	"Intro" = {
		"fk_times": "[[1], [2], [3], [4]]"
	}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if in_edit_mode:
		pass
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		print(fk_times_arr[0])
		
		var counter: int = 0
		for key in fk_times_arr:
			var button_name: String = ""
			match counter:
				0:
					button_name = "button_down"
				1:
					button_name = "button_up"
				2:
					button_name = "button_left"
				3:
					button_name = "button_right"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
			counter += 1
func SpawnFallingKey(button_name: String, delay:float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)
	
	
	
