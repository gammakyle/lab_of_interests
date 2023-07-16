extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var old_scene_value = 0
	var new_scene_value = 0
	SongScene.GLOBAL_OLD_SCENE = SongScene.GLOBAL_NOW_SCENE
	SongScene.GLOBAL_NOW_SCENE = 2
	if SongScene.GLOBAL_OLD_SCENE == 1 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-66.797, 0.064, 9.744)
	if SongScene.GLOBAL_OLD_SCENE == 3 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-17.984, 0.064, 53.716)
	if SongScene.GLOBAL_OLD_SCENE == 4 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-70.012, 0.064, 46.653)
	if SongScene.GLOBAL_OLD_SCENE == 5 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-37.055, 0.064, 42.82)
	if SongScene.GLOBAL_OLD_SCENE == 6 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(1.733, 0.064, 27.814)
	if SongScene.GLOBAL_OLD_SCENE == 7 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-19.23, 0.064, 17.381)
	if SongScene.GLOBAL_OLD_SCENE == 8 and SongScene.GLOBAL_NOW_SCENE == 2:
		$Player.global_transform.origin = Vector3(-38.056, 0.064, 8.283)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
