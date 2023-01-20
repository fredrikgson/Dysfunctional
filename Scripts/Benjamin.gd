extends FamilyMember

func _ready():
	member = GlobalData.family_members.BENJAMIN
	GlobalData.benjamin_ref = self
	if member == GlobalData.currently_controlling:
		selection_arrow.visible = true
	else:
		selection_arrow.visible = false
