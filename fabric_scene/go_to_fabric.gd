extends Area3D

var fabric_scene = preload("res://wood_turner_inside_scene/wood_turner_inside_scene.tscn")
#@onready var _PRELOADER: Control = $"../../../Control"
@onready var _PRELOADER: ColorRect = $"../../../Control/ColorRect"
var alpha: float = 0
var animating_exit: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_PRELOADER.modulate = Color(1, 1, 1, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if animating_exit:
		alpha += delta * 255.0
		print(alpha)
		if alpha >= 255.0:
			alpha = 255.0
			animating_exit = false
			set_process(false)
		_PRELOADER.modulate = Color(1, 1, 1, alpha/255.0*2)


func _on_body_entered(body):
	if body.is_in_group("player"):
		_PRELOADER.modulate = Color(1, 1, 1, 0)
		var alpha: float = 0
		animating_exit = true
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(fabric_scene)
