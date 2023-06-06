extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# желаемый размер окна
	var desired_size = Vector2(1152, 648)
	
	# получаем размер текущего Viewport
	var viewport = get_viewport()
	var viewport_size = viewport.size

	
	# устанавливаем размер корневого узла
	var root_node = preload("res://root_node.tscn").instance()
	add_child(root_node)
	
	# устанавливаем размер корневого узла
	root_node.set("rect_size", desired_size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
