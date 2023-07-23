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
		"У станков можно выставить разную скорость за счет изменения количества оборотов. Информацию о том, как правильно выставлять скорость станка следует брать из таблицы или справочных материалов.",
		"Нельзя переключать или доводить до конца переключения, если таковые вызывают характерный звук, не входящий в зацепление звеньев шестеренки. В таком случае переключение нужно сделать при полной остановке.",
		"Прямые обороты означают движение осей в направлении нарастания координат, то есть вращение по часовой стрелке. На всех токарных станках прямые обороты включаются подачей рукоятки на себя, или же вправо.",
		"Обратные обороты, наоборот, означают движение осей в направлении уменьшения координат.  Обратные же подаются от себя, или же влево.",
		"Торможение должно осуществляться тормозом. Осуществление торможения за счет переключения передачи на реверс может привести к преждевременному износу станка.",
		"Для закрепления детали необходимо зажать ее в кулачковом патроне при помощи специального ключа.",
		"После проведенных работ ни в коем случае не останавливайте вращение, если не отведен резец, или тем более если не выключена подача.",
		"Отлично, давай теперь проверим то, как ты усвоил материал. Всего три вопроса.",
		"Ты услышал характерный звук трущихся шестеренок при переключении передач. Что делать в таком случае?",
		"Нужно включить прямые обороты. Как ты можешь это сделать?",
		"Можно ли осуществлять торможение за счет реверса?"
	]
	_label_text.set_text(SongScene.GLOBAL_TEXT_ARR[0])
	_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
	animation_player.play("anim_p2_1")
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
		animation_player.play("anim_p2_2")
	if _dialog_i == 2:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_3")
	if _dialog_i == 3:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_4")
	if _dialog_i == 4:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_5")
	if _dialog_i == 5:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_6")
	if _dialog_i == 6:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_7")
	if _dialog_i == 7:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		animation_player.play("anim_p2_8")
	if _dialog_i == 8:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.show()
		_b2.show()
		_b3.show()
		_b1.set_text("Повысить скорость")
		_b2.set_text("Остановить и переключить")
		_b3.set_text("Включить реверс")
	if _dialog_i == 9:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.set_text("Рычаг от себя")
		_b2.set_text("Изменением скорости")
		_b3.set_text("Рычаг на себя")
	if _dialog_i == 10:
		_label_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.set_text("Нельзя, только тормозом")
		_b2.set_text("Для быстрой остановки")
		_b3.set_text("При доп. смазке")
	if _dialog_i == 11:
		_label_text.set_text("Так. Давай посмотрим. Ты набрал "+str(_right)+" из 3 правильных ответов. Если ты захочешь вернуться к этому уроку - ты можешь сделать это в любое время. До новых встреч!")
		_label_info.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()+1))
		_b1.hide()
		_b2.hide()
		_b3.hide()
