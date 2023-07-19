extends Node3D

@onready var _b1 = $Panel/Button
@onready var _b2 = $Panel/Button2
@onready var _b3 = $Panel/Button4
@onready var _label_info = $Panel/Label2
@onready var _label_text = $Panel/Label

var textarray = [
	"Добро пожаловать! Этот курс познакомит тебя с самыми основами работы на токарном станке. Если тебе надоест - ты можешь в любой момент выйти и вернуться, когда захочешь.",
	"Давай начнем с самого начала. Когда рабочий приходит "
]

var dataarray = [
	1
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
