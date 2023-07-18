extends Area3D

var local_locker = 0
@onready var _info_panel: Panel = $"../../Player/interface/Panel"
@onready var _l_text: Label = $"../../Player/interface/Panel/Label_text"
@onready var _l_val: Label = $"../../Player/interface/Panel/Label_val"
@onready var _b1: Button = $"../../Player/interface/Panel/Button"
@onready var _b2: Button = $"../../Player/interface/Panel/Button2"
@onready var animation_player = $"../../Player/CamRoot2/ControllableCamera/GimbalH/GimbalV/Camera3D/AnimationPlayer"
@onready var controls = $"../../Player/Controls"
@onready var _main_control = $"../../Control"
var alpha = 0.0
var colorize = false
var stat = 1
var _dialog_i = 0
var _anim_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	_info_panel.hide()
	pass # Replace with function body.
	
func _process(delta):
	if (colorize == true) and (stat == 0):
		alpha -= delta * 255.0
		if alpha <= 0.0:
			alpha = 0.0
			colorize = false
			stat = 1
			_info_panel.hide()
		_info_panel.modulate = Color(1, 1, 1, alpha/255.0*4)
	if (colorize == true) and (stat == 2):
		alpha += delta * 255.0
		if alpha >= 250.0:
			alpha = 255.0
			colorize = false
			stat = 1
		_info_panel.modulate = Color(1, 1, 1, alpha/255.0*2)
	pass
	
func _on_body_entered(body):
	if local_locker == 0:
		var main_object = self.get_node(".").get_name()
		if body.is_in_group("player"):
			_main_control.hide()
			_info_panel.show()
			local_locker = 1
			controls._mobile_controls.visible = false
			controls._mobile_controls._move_stick.set("_value", Vector2(0, 0))
			var player = get_node("../../Player")
			var destination
			#-----------------------------------#
			if main_object == "info_milling_1":
				destination = Vector3(11.012, 0.064, -6.478)
				_anim_name = "animation_eks_1"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"Я являюсь мастером фрезеровочного цеха в нашей компании. ",
					"В моей работе используется специальное оборудование - фрезерные станки.",
					"Они оснащены вращающимся режущим инструментом - фрезой, которая удаляет материал с поверхности заготовки и создает необходимую форму или профиль.",
					"В процессе работы я контролирую все параметры, такие как скорость вращения шпинделя, подачу, глубину резки и множество других.",
					"Первым шагом я выбираю подходящую фрезу, учитывая требования по материалу, форме и объему обработки. ",
					"Фреза - это режущий инструмент с острыми зубьями, который будет удалять материал в процессе работы.",
					"Затем я закрепляю фрезу в фрезерном инструменте, устанавливаю необходимые параметры резки, такие как глубина резки и скорость вращения.",
					"После настройки я приступаю к фрезерованию. Для начала опускаю фрезерный инструмент на заготовку, а затем передвигаю его вдоль необходимой траектории.",
					"Сначала я прохожу черновой этап - формирование контура с небольшим припуском, а затем при чистовом проходе убираю припуск и добиваюсь идеальных размеров."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			if main_object == "info_milling_2":
				destination = Vector3(12.841, 0.064, 7.434)
				_anim_name = "animation_eks_2"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"Станки бывают разные. И не только по типу обработки металла.",
					"Некоторые станки требуют усилия человека, а некоторые следуют написанным программам.",
					"Когда необходимо произвести большие объемы однотипных деталей, удобнее использовать станоки с ЧПУ.",
					"Когда же требуется создать что-то особенное и индивидуальное, специалист берет эту задачу на себя.",
					"Существует множество факторов, по которым решается, как производить ту или иную деталь.",
					"Например точность, повторяемость, масштаб производства, сложность операций.",
					"На текущий момент почти все станки имеют свои версии как для ручной обработки, так и с блоком управления.",
					"И те и другие являются неотъемлемой частью производства."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			colorize = true
			stat = 2
			player.global_transform.origin = destination

func _on_body_exited(body):
	local_locker = 0
	_main_control.show()
	print("выход из области.")
	

func _on_button_2_pressed():
	_dialog_i = _dialog_i+1
	if _dialog_i == SongScene.GLOBAL_TEXT_ARR.size()-1:
		_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
		_b2.set_text("До встречи")
	elif _dialog_i == SongScene.GLOBAL_TEXT_ARR.size():
		animation_player.play_backwards(_anim_name)
		_anim_name = ""
		controls._mobile_controls.visible = true
		colorize = true
		stat = 0
		_dialog_i = 0
		pass
	else:
		_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
		_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
