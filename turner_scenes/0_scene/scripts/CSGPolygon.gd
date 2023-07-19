extends CSGPolygon3D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _polygon = []
var _polygon2 = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var thickness := 1.0
	var offset := thickness / 1.0
	_polygon = [
		Vector2(7, -3),
		Vector2(7, 4),
		Vector2(3, 4),
		Vector2(1, 2),
		Vector2(1, 1),
	]
	_polygon2 = [
		Vector2(1, 1),
		Vector2(2, 0),
		Vector2(2, -2),
		Vector2(3, -3),
	]
	_polygon+=_polygon2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
