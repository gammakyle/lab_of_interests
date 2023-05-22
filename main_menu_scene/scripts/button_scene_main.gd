extends Button

func _on_pressed():
	var main_scene = load("res://main_scene/Main.tscn")
	var main_scene_instance = main_scene.instance()
	get_tree().set_current_scene(main_scene_instance)

