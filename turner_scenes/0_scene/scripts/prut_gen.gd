extends CSGPolygon

var _modificator = 5.0
var _height_bar = 3.0
var _length_bar = 15.0
var _temp_val = 0.0

func _ready():
	polygon = PoolVector2Array([
		Vector2(0, _length_bar), 
		Vector2(0, 0),
	])
	var polygon_2 = PoolVector2Array([])
	for i in range(0,(_modificator*_length_bar)):
		_temp_val = _length_bar-(((_length_bar*_modificator)-i)/_modificator)
		polygon_2.push_back(Vector2(_height_bar+((randi()%10)/99.2), _temp_val))
	polygon=polygon+polygon_2
	pass

func _process(delta):
	var _resec = get_node("/root/Spatial/RigidBody2")
	var _left_pos_node = get_node("/root/Spatial/RigidBody2/left_pos")
	var _right_pos_node = get_node("/root/Spatial/RigidBody2/right_pos")
	var _l_pos_x = -(_left_pos_node.global_transform.origin.x)
	var _r_pos_x = -(_right_pos_node.global_transform.origin.x)
	var _pos_z = _left_pos_node.global_transform.origin.z
	if Input.is_action_pressed("ui_right"):
		_resec.global_transform.origin.x +=0.05
	if Input.is_action_pressed("ui_left"):
		_resec.global_transform.origin.x -=0.05
	if Input.is_action_pressed("ui_down"):
		_resec.global_transform.origin.z +=0.05
	if Input.is_action_pressed("ui_up"):
		_resec.global_transform.origin.z -=0.05
	#print("_l_pos_x "+str(_l_pos_x))
	#print("_r_pos_x "+str(_r_pos_x))
	#print("_pos_z "+str(_pos_z))
	
	#for i in range(0,(_modificator*_length_bar)):
	if(_r_pos_x>_length_bar):
		_r_pos_x=_length_bar
	for i in range(int(_l_pos_x*_modificator),int(_modificator*_r_pos_x)):
		#print("polygon[i+2].x "+str(polygon[i+2].x))
		#print("polygon[i+2].y "+str(polygon[i+2].y))
		if((polygon[i+2].x>_pos_z)):
			if(_pos_z<=0):
				if(polygon[i+2].x!=0):
					polygon[i+2].x=0.001
			else:
				polygon[i+2].x=_pos_z
			#print(str(polygon[i+2].x)+" "+str(i))
	
