extends Area3D

var local_locker = 0
@onready var _info_panel: Panel = $"../../../../Player/interface/Panel"
@onready var _l_text: Label = $"../../../../Player/interface/Panel/Label_text"
@onready var _l_val: Label = $"../../../../Player/interface/Panel/Label_val"
@onready var _b1: Button = $"../../../../Player/interface/Panel/Button"
@onready var _b2: Button = $"../../../../Player/interface/Panel/Button2"
@onready var animation_player = $"../../../../Player/CamRoot2/ControllableCamera/GimbalH/GimbalV/Camera3D/AnimationPlayer"
@onready var controls = $"../../../../Player/Controls"
@onready var _main_control = $"../../../../Control"
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
			var player = get_node("../../../../Player")
			var destination
			#-----------------------------------#
			if main_object == "info_turner_2":
				destination = Vector3(-1.123, 0.064, 5.094)
				_anim_name = "animation_eks_2"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"В большинстве случаев работа - сдельная. Это значит, что зарплата зависит от количества выполненной работы.",
					"Ну и от ее качества, конечно же.",
					"Так что если ты работаешь эффективно - то и вознаграждение будет хорошим.",
					"Помимо этого, повышая свои навыки, ты растешь и получаешь новые разряды.",
					"Они позволяют выполнять более ответственные детали, за более высокую стоимость.",
					"Удачи тебе, заходи еще."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			if main_object == "info_turner_1":
				destination = Vector3(4.436, 0.064, -10.56)
				_anim_name = "animation_eks_1"
				animation_player.play(_anim_name)
				SongScene.GLOBAL_TEXT_ARR = [
					"Здравствуй! Добро пожаловать в токарный цех. Я работаю тут уже много лет, и занимаю должность мастера",
					"Мы используем специальные токарные станки, чтобы обрабатывать и формировать металлические детали",
					"Принцип его работы прост: заготовка устанавливается на станке и закрепляется в специальном приспособлении.",
					"Затем, когда станок включается, заготовка начинает вращаться. Мастер выбирает  резец или сверло и прикладывает его к заготовке. ",
					"При соприкосновении с поверхностью заготовки, инструмент начинает срезать или снимать металл.",
					"Мастер перемещает инструмент вдоль заготовки по определенной траектории, чтобы создать нужную форму или вырезать отверстие.",
					"При этом, чтобы получить ровную поверхность, он должен контролировать давление и скорость движения инструмента."
				]
				_b1.modulate = Color(1, 1, 1, 0)
				_l_text.set_text(str(SongScene.GLOBAL_TEXT_ARR[_dialog_i]))
				_l_val.set_text(str(_dialog_i+1) + "/" + str(SongScene.GLOBAL_TEXT_ARR.size()))
				_b2.set_text("Далее")
			#-----------------------------------#
			if main_object == "work_turner_1":
				destination = Vector3(10.326, 0.064, 4.227)
				animation_player.play("animation_work_1")
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
