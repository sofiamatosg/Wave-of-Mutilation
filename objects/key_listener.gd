extends Sprite2D

@onready var falling_key = preload("res://objects/falling_key.tscn")
@onready var score_text = preload("res://levels/screen_text.tscn")
@export var key_name: String = ""

var falling_key_queue = []

var perfect_press_treshold: float = 18
var great_press_treshold: float = 38
var good_press_treshold: float = 48
var ok_press_treahold: float = 68
#otherwise, miss

var perfect_press_score: float = 25
var great_press_score: float = 20
var good_press_score: float = 5
var ok_press_score: float = 2

func _ready():
	$GlowOverlay.frame = frame + 4
	Signals.CreateFallingKey.connect(CreateFallingKey)

func _process(delta):
	if falling_key_queue.size() > 0:
		
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
			
			#print MISS
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo("MISS")
			st_inst.global_position = global_position + Vector2(0, -15)
			Signals.ResetCombo.emit()
			
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			var distance_from_pass = abs(key_to_pop.pass_treshold - key_to_pop.global_position.y)
			$AnimationPlayer.stop()
			$AnimationPlayer.play("key_hit")
			print(distance_from_pass)
			var press_score_text:String = ""
			if key_to_pop.global_position.y > 344:
				press_score_text = "MISS"
				Signals.ResetCombo.emit()
				falling_key_queue.pop_front()
				key_to_pop.queue_free()
			
			elif distance_from_pass < great_press_treshold:
				Signals.IncrementScore.emit(great_press_score)
				press_score_text = "GREAT"
				Signals.IncrementCombo.emit()
				key_to_pop.queue_free()
			
			elif distance_from_pass < good_press_treshold:
				Signals.IncrementScore.emit(good_press_score)
				press_score_text = "GOOD"
				Signals.IncrementCombo.emit()
				key_to_pop.queue_free()
			
			elif distance_from_pass < ok_press_treahold:
				Signals.IncrementScore.emit(ok_press_score)
				press_score_text = "OK"
				Signals.IncrementCombo.emit()
				key_to_pop.queue_free()
			else:
				press_score_text = "MISS"
				Signals.ResetCombo.emit()
			


			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo(press_score_text)
			st_inst.global_position = global_position + Vector2(0, -15)

func CreateFallingKey(button_name: String):
	if button_name == key_name:
		var fk_inst = falling_key.instantiate()
		
		get_tree().get_root().call_deferred("add_child", fk_inst)
		fk_inst.Setup(position.x, frame + 4)
		
		falling_key_queue.push_back(fk_inst)
	
	
func _on_random_spawn_timer_timeout() -> void:
	#CreateFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
