extends Area3D

var local_locker = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	pass
	
func _on_body_entered(body):
	if local_locker == 0:
		var main_object = self.get_node(".").get_name()
		if body.is_in_group("player"):
			local_locker = 1
			var controls = get_node("../../../../Player/Controls")
			controls._mobile_controls.visible = false
			controls._mobile_controls._move_stick.set("_value", Vector2(0, 0))
			var player = get_node("../../../../Player")
			var animation_player = $"../../../../Player/CamRoot2/ControllableCamera/GimbalH/GimbalV/Camera3D/AnimationPlayer"
			var anim_name = "none"
			var destination
			if main_object == "info_turner_1":
				destination = Vector3(4.436, 0.064, -10.56)
				animation_player.play("animation_eks_1")
			if main_object == "work_turner_1":
				destination = Vector3(10.326, 0.064, 4.227)
				animation_player.play("animation_work_1")
			player.global_transform.origin = destination
			animation_player.play(anim_name)

func _on_body_exited(body):
	local_locker = 0
	print("выход из области.")

