extends CharacterBody2D
var health = 100
var max_health = 100
var min_health = 0
var body_count = 0
func _ready():
	Signals.DecreaseLife.connect(DecreaseLife)
	
	var anim = $AnimationPlayer.get_animation("enemy_walk")
	anim.loop_mode = Animation.LOOP_LINEAR

func DecreaseLife (damage: int):
	health -= damage
	print(health)
	if health <= 0:
		body_count += 1
		health = 100
		$AnimationPlayer.play("enemy_walk")
		$AnimationPlayer.seek(0.0, true)



		
