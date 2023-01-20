extends Area2D

var members_in_area = 0
var completion_scene = "res://Levels/GameCompletedScene.tscn"
onready var anim = $CanvasLayer/AnimationPlayer

func _on_TriggerGameCompletion_body_entered(body):
	if body.is_in_group("FamilyMember"):
		members_in_area += 1
		if members_in_area >= 3:
			GlobalData.currently_controlling = null
			anim.play("FadeOutScene")

func fade_out_completed():
	get_tree().change_scene(completion_scene)

func _on_TriggerGameCompletion_body_exited(body):
	if body.is_in_group("FamilyMember"):
		members_in_area -= 1
