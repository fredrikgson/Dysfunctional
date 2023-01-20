extends Area2D

var members_in_area = 0
export(String) var next_scene_path

func _on_CompletionBox_body_entered(body):
	if body.is_in_group("FamilyMember"):
		members_in_area += 1
		if members_in_area >= 3:
			get_tree().change_scene(next_scene_path)


func _on_CompletionBox_body_exited(body):
	if body.is_in_group("FamilyMember"):
		members_in_area -= 1
