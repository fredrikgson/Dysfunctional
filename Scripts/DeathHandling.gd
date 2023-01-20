extends Node2D

var last_controlled

onready var timer = $Timer

func kill():
	last_controlled = GlobalData.currently_controlling
	GlobalData.currently_controlling = null
	MusicPlayer.play_death_sound()
	GlobalWorldEnvironment.environment.adjustment_saturation = 0.3
	Engine.time_scale = 0.01
	timer.start()


func _on_Timer_timeout():
	Engine.time_scale = 1
	GlobalData.currently_controlling = last_controlled
	GlobalWorldEnvironment.environment.adjustment_saturation = 1
	get_tree().reload_current_scene()
