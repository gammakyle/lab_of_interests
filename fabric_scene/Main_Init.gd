extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var old_scene_value = 0
	var new_scene_value = 0
	SongScene.GLOBAL_OLD_SCENE = SongScene.GLOBAL_NOW_SCENE
	SongScene.GLOBAL_NOW_SCENE = 1
	if SongScene.GLOBAL_OLD_SCENE == 2 and SongScene.GLOBAL_NOW_SCENE == 1:
		$Player.global_transform.origin = Vector3(21.518, 0.064, -16)
	
	pass # Replace with function body.
