extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer2

func _ready():
	# Получаем ссылку на анимационный плеер
	animation_player.play()
