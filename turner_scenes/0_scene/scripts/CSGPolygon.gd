extends CSGPolygon


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var thickness := 1.0
	var offset := thickness / 1.0
	polygon = PoolVector2Array([
		Vector2(7, -3),
		Vector2(7, 4),
		Vector2(3, 4),
		Vector2(1, 2),
		Vector2(1, 1),
	])
	var polygon2 = PoolVector2Array([
		Vector2(1, 1),
		Vector2(2, 0),
		Vector2(2, -2),
		Vector2(3, -3),
	])
	polygon+=polygon2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
