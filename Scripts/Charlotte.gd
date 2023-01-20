extends FamilyMember

func _ready():
	member = GlobalData.family_members.CHARLOTTE
	GlobalData.charlotte_ref = self
	JUMP_FORCE = 150
	if member == GlobalData.currently_controlling:
		selection_arrow.visible = true
	else:
		selection_arrow.visible = false
