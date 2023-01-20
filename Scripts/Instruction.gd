extends Node2D

export(String) var instruction = "Type instruction here"
export(float) var time_before_fade_in = 1
onready var anim = $AnimationPlayer
onready var label = $Label
onready var timer = $Timer

func _ready():
	label.text = instruction
	timer.wait_time = time_before_fade_in
	timer.start()


func _on_Timer_timeout():
	anim.play("FadeIn")
