extends Area2D

func _on_DeathBox_body_entered(body):
	if body.is_in_group("FamilyMember"): # if a member falls into the death box
		DeathHandling.kill()

