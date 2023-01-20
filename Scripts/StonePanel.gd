extends Area2D

export(Array, NodePath) var connected_items
var benjamin_in_area = false
export(bool) var activated = false
var can_interact = true
onready var anim = $AnimationPlayer
onready var asp = $AudioStreamPlayer

func _ready():
	if activated:
		anim.play("On")
	else:
		anim.play("Off")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact == true and GlobalData.currently_controlling == GlobalData.family_members.BENJAMIN:
		if benjamin_in_area and activated == false:
			activated = true
			can_interact = false
			anim.play("Activating")
			asp.play()
			for i in range(0,connected_items.size()):
				get_node(connected_items[i]).activate()
		elif benjamin_in_area and activated == true:
			activated = false
			can_interact = false
			anim.play("Deactivating")
			asp.play()
			for i in range(0,connected_items.size()):
				get_node(connected_items[i]).deactivate()



func activating_anim_complete():
	anim.play("On")
	can_interact = true
func deactivating_anim_complete():
	anim.play("Off")
	can_interact = true


func _on_StonePanel_body_entered(body):
	if body.is_in_group("FamilyMember"):
		if body.member == GlobalData.family_members.BENJAMIN:
			benjamin_in_area = true


func _on_StonePanel_body_exited(body):
	if body.is_in_group("FamilyMember"):
		if body.member == GlobalData.family_members.BENJAMIN:
			benjamin_in_area = false
