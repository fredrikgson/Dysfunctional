extends Node2D

func cutscene_completed():
	GlobalData.currently_controlling = GlobalData.family_members.CHARLOTTE
	get_tree().change_scene("res://Levels/Level1.tscn")
