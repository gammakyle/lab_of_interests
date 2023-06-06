extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Пересечение с объектом Player.")
	pass # Replace with function body.
	
func _process(delta):
	rotate(Vector3(0,1,0),0.1)

