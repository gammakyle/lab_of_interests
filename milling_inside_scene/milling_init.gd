extends Node3D

@onready var _info_panel: Panel = $Player/interface/Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	SongScene.GLOBAL_OLD_SCENE = SongScene.GLOBAL_NOW_SCENE
	SongScene.GLOBAL_NOW_SCENE = 5
	_info_panel.modulate = Color(1, 1, 1, 0)
	pass # Replace with function body.


