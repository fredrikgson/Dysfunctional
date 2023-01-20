extends StaticBody2D

export(Array, NodePath) var connected_doors
var members_in_area = 0
var is_pressed = false
onready var sprite = $Sprite
onready var asp = $AudioStreamPlayer


func _on_Button_body_entered(body):
	if body.is_in_group("FamilyMember"):
		members_in_area += 1
		if is_pressed == false: 
			press()
			asp.play()


func _on_Button_body_exited(body):
	if body.is_in_group("FamilyMember"):
		members_in_area -= 1
		if members_in_area <= 0 and is_pressed == true:
			unpress()
			asp.play()


func press():
	is_pressed = true
	sprite.frame = 1
	for i in range(0,connected_doors.size()):
		get_node(connected_doors[i]).toggle()
func unpress():
	is_pressed = false
	sprite.frame = 0
	for i in range(0,connected_doors.size()):
		get_node(connected_doors[i]).toggle()
