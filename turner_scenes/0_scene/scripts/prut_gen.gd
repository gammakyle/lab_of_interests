extends CSGPolygon3D

var _modificator = 5.0
var _height_bar = 3.0
var _length_bar = 15.0
var _temp_val = 0.0
var _polygon = PackedVector2Array([])
var polygon_2 = PackedVector2Array([])
@onready var _model_detal = $"."
@onready var _resec = $"../../../../../RigidBody2"
@onready var _left_pos_node = $"../../../../../RigidBody2/left_pos"
@onready var _right_pos_node = $"../../../../../RigidBody2/right_pos"
var _l_pos_x = 0.0
var _r_pos_x = 0.0
var _pos_z = 0.0

func _ready():
	_polygon = PackedVector2Array([
		Vector2(0, _length_bar), 
		Vector2(0, 0),
	])
	polygon_2 = PackedVector2Array([])
	for i in range(0,(_modificator*_length_bar)):
		_temp_val = _length_bar-(((_length_bar*_modificator)-i)/_modificator)
		polygon_2.push_back(Vector2(_height_bar+((randi()%10)/99.2), _temp_val))
	_polygon=_polygon+polygon_2
	_model_detal.polygon = _polygon
	pass

func _process(delta):
	_l_pos_x = -(_left_pos_node.global_transform.origin.x)
	_r_pos_x = -(_right_pos_node.global_transform.origin.x)
	_pos_z = _left_pos_node.global_transform.origin.z
	if Input.is_action_pressed("ui_right"):
		_resec.global_transform.origin.x +=0.2
	if Input.is_action_pressed("ui_left"):
		_resec.global_transform.origin.x -=0.2
	if Input.is_action_pressed("ui_down"):
		_resec.global_transform.origin.z +=0.2
	if Input.is_action_pressed("ui_up"):
		_resec.global_transform.origin.z -=0.2
	#print("_l_pos_x "+str(_l_pos_x))
	#print("_r_pos_x "+str(_r_pos_x))
	#print("_pos_z "+str(_pos_z))
	
	#for i in range(0,(_modificator*_length_bar)):
	if(_r_pos_x>_length_bar):
		_r_pos_x=_length_bar
	for i in range(int(_l_pos_x*_modificator),int(_modificator*_r_pos_x)):
		#print("polygon[i+2].x "+str(polygon[i+2].x))
		#print("polygon[i+2].y "+str(polygon[i+2].y))
		if((_polygon[i+2].x>_pos_z)):
			if(_pos_z<=0):
				if(_polygon[i+2].x!=0):
					_polygon[i+2].x=0.5
			else:
				_polygon[i+2].x=_pos_z
	_model_detal.polygon = _polygon
			#print(str(polygon[i+2].x)+" "+str(i))
	
