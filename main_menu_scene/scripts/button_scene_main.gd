extends Button

var main_scene = preload("res://wood_turner_inside_scene/wood_turner_inside_scene.tscn")

func _on_pressed():
	#var main_scene_instance = main_scene.instance()
	#get_tree().set_current_scene(main_scene_instance)
	get_tree().change_scene_to_packed(main_scene)
	

