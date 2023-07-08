extends Button

var main_scene = preload("res://fabric_scene/Main.tscn")

func _on_pressed():
	var root = get_tree().get_root()
	var music_object = $"../music_object"
	root.add_child(music_object)
	#var main_scene_instance = main_scene.instance()
	#get_tree().set_current_scene(main_scene_instance)
	get_tree().change_scene_to_packed(main_scene)
