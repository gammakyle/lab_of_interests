extends Node3D

var _excursion = load("res://job_turner_2/job_turner_ekskurs_2.tscn")

# Called when the node enters the scene tree for the first time
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_packed(_excursion)

