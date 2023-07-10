extends Control


# Called when the node enters the scene tree for the first time.
@onready var _PRELOADER: ColorRect = $ColorRect
var alpha: float = 255.0
var animating: bool = false

func _ready():
	_PRELOADER.modulate = Color(1, 1, 1, 1)
	animating = true
	await get_tree().create_timer(1.0).timeout
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if animating:
		alpha -= delta * 255.0
		print(alpha)
		if alpha <= 0.0:
			alpha = 0.0
			animating = false
			set_process(false)
		_PRELOADER.modulate = Color(1, 1, 1, alpha/255.0*2)


