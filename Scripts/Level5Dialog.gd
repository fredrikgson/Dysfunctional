extends Area2D

onready var anim = $DialogAnim
var played = false

func _on_DialogTriggerBox_body_entered(body):
	if body.is_in_group("FamilyMember"):
		if played == false:
			played = true
			anim.play("Level5Dialog")
