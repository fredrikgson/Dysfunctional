extends Node2D

onready var anim = $AnimationPlayer

func _on_Timer_timeout():
	anim.play("Level9Dialog")
