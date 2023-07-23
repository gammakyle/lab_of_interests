extends Node3D

var fabric_scene = load("res://wood_turner_inside_scene/wood_turner_inside_scene.tscn")
@onready var _b1 = $Panel/Button
@onready var _b2 = $Panel/Button2
@onready var _b3 = $Panel/Button4
@onready var _label_info = $Panel/Label2
@onready var _label_text = $Panel/Label
@onready var animation_player = $Camera/AnimationPlayer
var _dialog_i = 0
var _right = 0

var dataarray = [
	1
]

# Called when the node enters the scene tree for the first time.
func _ready():
	_b1.hide()
	_b2.hide()
	_b3.set_text("Далее")
	SongScene.GLOBAL_TEXT_ARR = [
		"Безопасность при работе – это самое важное. Жизнь – самое ценное, что у тебя есть, и ее нужно беречь.",
		"При работе со станком могут возникнуть опасные факторы. Давай посмотрим, как можно свести их к минимум",
		"Когда рабочий приходит на рабочее место, ему стоит убедится в исправности оборудования и убрать лишние вещи, которые могут помешать во время работы. ",
		"Кожухи и дверки должны быть закрыты, подача жидкости выключена, сопло подачи жидкости направлено вниз, ключ должен быть убран из патрона.",
		"Обязательно проверьте, чтобы на одежде не было свисающих элементов, это чревато травмами, так как станок попросту может затянуть и намотать этот элемент одежды.",
		"Убедитесь, что ничего не мешает шпинделю при его вращении. Уберите все мешающие элементы.",
		"Убедитесь, что детали не имеют значительного вылета из патрона, или имеют поджатие с другого конца.",
		"Отлично, давай теперь проверим то, как ты усвоил материал. Всего три вопроса.",
		"Что нужно сделать с ключом, если он вставлен в момент, когда ты готовишься включить станок?",
		"Если что-то мешает шпинделю - что мы должны сделать?",
		"Если детали имеют значительный вылет - как мы можем это решить?"
	]
	_label_text.set_text(SongScene.GLOBAL_TEXT_ARR[0])
	_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_pressed():
	get_tree().change_scene_to_packed(fabric_scene)
	pass # Replace with function body.



func _on_button_pressed():
	if _dialog_i == 8:
		_right = _right
	if _dialog_i == 9:
		_right = _right
	if _dialog_i == 10:
		_right = _right+1
	_history_info()
	pass # Replace with function body.


func _on_button_2_pressed():
	if _dialog_i == 8:
		_right = _right+1
	if _dialog_i == 9:
		_right = _right
	if _dialog_i == 10:
		_right = _right
	_history_info()
	pass # Replace with function body.
	
func _on_button_4_pressed():
	if _dialog_i == 8:
		_right = _right
	if _dialog_i == 9:
		_right = _right+1
	if _dialog_i == 10:
		_right = _right
	_history_info()
	pass # Replace with function body.


func _history_info():
	_dialog_i = _dialog_i+1
	if _dialog_i == 1:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
	if _dialog_i == 2:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_1")
	if _dialog_i == 3:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_2")
	if _dialog_i == 4:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_3")
	if _dialog_i == 5:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_4")
	if _dialog_i == 6:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_5")
	if _dialog_i == 7:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p_6")
	if _dialog_i == 8:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.show()
		_b2.show()
		_b3.show()
		_b1.set_text("Закрепить ключ")
		_b2.set_text("Вынуть ключ")
		_b3.set_text("Повернуть ключ")
	if _dialog_i == 9:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.set_text("Провернуть вкручную")
		_b2.set_text("Сменить шпиндель")
		_b3.set_text("Устранить помехи")
	if _dialog_i == 10:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.set_text("Закрепить поджатием")
		_b2.set_text("Подложить поддон")
		_b3.set_text("Оставить как есть")
	if _dialog_i == 11:
		_label_text.set_text("Так. Давай посмотрим. Ты набрал "+str(_right)+" из 3 правильных ответов. Если ты захочешь вернуться к этому уроку - ты можешь сделать это в любое время. До новых встреч!")
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.hide()
		_b2.hide()
		_b3.hide()
