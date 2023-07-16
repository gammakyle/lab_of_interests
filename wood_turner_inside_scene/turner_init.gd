extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	SongScene.GLOBAL_OLD_SCENE = SongScene.GLOBAL_NOW_SCENE
	SongScene.GLOBAL_NOW_SCENE = 3
	pass # Replace with function body.
