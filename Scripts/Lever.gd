extends Area2D

export(NodePath) var door
var members_in_area = 0
var currently_controlled_member_in_area = false
var lever_pulled = false
onready var anim = $AnimationPlayer
onready var asp = $AudioStreamPlayer

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if members_in_area > 0 and lever_pulled == false and currently_controlled_member_in_area:
			lever_pulled = true
			anim.play("Pulling")
			asp.play()


func _on_Lever_body_entered(body):
	if body.is_in_group("FamilyMember"):
		members_in_area += 1
		if body.member == GlobalData.currently_controlling:
			currently_controlled_member_in_area = true


func _on_Lever_body_exited(body):
	if body.is_in_group("FamilyMember"):
		members_in_area -= 1
		if body.member == GlobalData.currently_controlling:
			currently_controlled_member_in_area = false

func pulling_anim_complete():
	anim.play("On")
	var corresponding_door = get_node(door)
	corresponding_door.open()
