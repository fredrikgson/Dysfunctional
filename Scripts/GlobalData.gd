extends Node

enum family_members {
	BENJAMIN,
	NATHAN,
	CHARLOTTE
}
var currently_controlling = null

var benjamin_ref = null
var nathan_ref = null
var charlotte_ref = null

func get_ref_from_enum(member):
	match member:
		family_members.BENJAMIN:
			return benjamin_ref
		family_members.NATHAN:
			return nathan_ref
		family_members.CHARLOTTE:
			return charlotte_ref
	

func change_controlled_member():
	match currently_controlling:
		family_members.CHARLOTTE:
			currently_controlling = family_members.BENJAMIN
			charlotte_ref.selection_arrow.visible = false
			benjamin_ref.selection_arrow.visible = true
		family_members.BENJAMIN:
			benjamin_ref.selection_arrow.visible = false
			nathan_ref.selection_arrow.visible = true
			currently_controlling = family_members.NATHAN
		family_members.NATHAN:
			nathan_ref.selection_arrow.visible = false
			charlotte_ref.selection_arrow.visible = true
			currently_controlling = family_members.CHARLOTTE

func change_controlled_member_to(member):
	currently_controlling = member
	benjamin_ref.selection_arrow.visible = false
	nathan_ref.selection_arrow.visible = false
	charlotte_ref.selection_arrow.visible = false
	get_ref_from_enum(currently_controlling).selection_arrow.visible = true
	get_ref_from_enum(currently_controlling).asp_select.play()

