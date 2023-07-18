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
			if main_object == "info_development_1":
				destination = Vector3(-25.655, 0.064, 35.787)
				_anim_name = "animation_eks_1"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"Если производства - это сердце предприятия, то конструкторское и технологическое бюро - его мозг.",
					"У нас в конструкторско-технологическом бюро работает команда талантливых и грамотных специалистов.",
					"Технологи и конструкторы играют непосредственную роль в разработке новых продуктов и улучшении существующих.",
					"Технологи разбираются в технических аспектах и материалах, чтобы повысить качество изделий. ",
					"Технологи разрабатывают техническую документацию, включая чертежи и спецификации.",
					"Вместе с технологами работает команда конструкторов. Они отвечают за разработку новых продуктов и модификацию существующих.",
					"Конструкторы используют различные программы и инструменты для создания трехмерных моделей и детальные чертежи.",
					"Также они проводят тестирование и анализ результатов, чтобы гарантировать работоспособность изделий.",
					"Я работаю в тесном сотрудничестве с другими отделами и руководителями проектов, чтобы производство не останавливалось ни на миг.",
					"Конструкторы и технологи - неотъемлемая часть нашей команды. Их труд и профессионализм позволяют нам оставаться конкурентоспособными и достигать успеха.",
					"Если ты хочешь изобретать и участвовать в разработке новых изделий - тебе стоит присоединиться к нам."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			if main_object == "info_development_2":
				destination = Vector3(-13.073, 0.064, 22.667)
				_anim_name = "animation_eks_3"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"Привет! Видишь эту здоровую штуку позади меня?",
					"Это щуп, который позволяет предельно точно снимать размеры изделий.",
					"Так мы можем проводить контрольные замеры для достижения поразительной точности.",
					"Вообще для измерения используется много разных приборов.",
					"Штангенциркуль, микрометр, концевые меры, профилометр - и многое другое.",
					"Своевременный контроль производимой продукции - это важная часть производственного процесса."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			if main_object == "info_development_3":
				destination = Vector3(-39.672, 0.064, 39.792)
				_anim_name = "animation_eks_2"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"У каждого предприятия есть свои наработки, и наше - не исключение.",
					"Только представь, сотни чертежей, листов документации и опытных наработок.",
					"Такую базу нужно где-то хранить, поэтому у нас есть свой собственный архив.",
					"И научно-техническая библиотека тоже есть. Они хранят знания всех предыдущих наработок.",
					"Опираясь на прошлые достижения мы можем смело идти вперед и разарабатывать новые продукты."
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
