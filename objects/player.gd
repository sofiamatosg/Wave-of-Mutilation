extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func _ready():
	Signals.PlayAnimation.connect(PlayAnimation)

func PlayAnimation():
	animated_sprite_2d.play("play")
