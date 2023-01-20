extends Area2D

func _on_StopMusic_body_entered(body):
	if body.is_in_group("FamilyMember"):
		MusicPlayer.stop_BGM()
