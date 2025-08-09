extends CharacterBody2D
var health = 100
var max_health = 100
var min_health = 0
var body_count = 0
var sprite_x = $Sprite2D.global_position.x

func _ready():
	Signals.DecreaseLife.connect(DecreaseLife)
	await get_tree().create_timer(8.0).timeout

	var anim = $AnimationPlayer.get_animation("enemy_walk")
	$AnimationPlayer.play("enemy_walk")
	anim.loop_mode = Animation.LOOP_LINEAR

func _process(delta):
	var sprite_global = $Sprite2D.to_global(Vector2.ZERO)
	print(sprite_global.x)
	if sprite_global.x <=  50 and health > 0:
		print("tchi tchi")
		Signals.Lost.emit()
func DecreaseLife (damage: int):
	health -= damage
	print(health)
	if health <= 0:
		body_count += 1
		health = 100
		$AnimationPlayer.play("enemy_walk")
		$AnimationPlayer.seek(0.0, true)


		
