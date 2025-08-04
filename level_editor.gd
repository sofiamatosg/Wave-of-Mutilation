extends Node2D

const in_edit_mode: bool = false
var current_level_name = "Intro"


var level_info = {
	"Intro" = {
		"fk_times": "
		[[5, 7.7, 10.3, 12.8, 15.2, 24.6, 25, 27.1, 29.1, 31.5, 34.2, 34.8, 35, 35.2, 35.4, 35.6, 35.7, 37.2, 37.4, 37.6, 37.8, 38, 39.4, 39.6, 39.8, 40, 40.2], 
		[5.1, 6.1, 6.6, 7.6, 8.2, 8.8, 9.4, 10.2, 10.8, 11.4, 11.9, 12.7,13.3, 13.9, 14.4, 15.1, 15.7, 16.3,16.9, 18, 18.6, 19.2, 20.3, 20.9, 21.5, 22.6, 23.2, 23.8, 25.5, 26.1, 27, 27.6, 28.2, 28.7, 29.2, 29.9, 30.5, 31.1, 31.6, 32.3, 32.9, 33.5], 
		[5.2, 6.2, 6.7, 7.5, 8.3, 8.9, 9.5, 10.1, 10.9, 11.5, 12, 12.6, 13.4, 14, 14.5, 15, 15.8, 16.4, 17, 18.1, 18.7, 19.3, 20.4, 21, 21.6, 22.7, 23.3, 23.9, 25.6, 26.2, 26.9, 27.7, 28.3, 28.8, 29.3, 30, 30.6, 31.2, 31.7, 32.4, 33, 33.6, 38.7, 42.1, 42.3, 42.5, 42.7, 42.9], 
		[1,7.4, 10, 12.5, 14.9, 26.8, 29.4, 31.8, 34.1, 34.7, 38.9]]"
	}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if in_edit_mode:
		pass
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		#print(fk_times_arr[0])
		
		var counter: int = 0
		for key in fk_times_arr:
			var button_name: String = ""
			match counter:
				0:
					button_name = "button_left"
				1:
					button_name = "button_down"
				2:
					button_name = "button_up"
				3:
					button_name = "button_right"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
			counter += 1
func SpawnFallingKey(button_name: String, delay:float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)
	
	
	
