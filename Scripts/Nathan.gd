extends FamilyMember

onready var punch_field = $PunchField/CollisionShape2D

func _ready():
	member = GlobalData.family_members.NATHAN
	GlobalData.nathan_ref = self
	if member == GlobalData.currently_controlling:
		selection_arrow.visible = true
	else:
		selection_arrow.visible = false
	
	punch_field.disabled = true

func punch_anim_complete():
	busy = false
	punch_field.disabled = true


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if GlobalData.currently_controlling == member:
			busy = true
			anim.play("Punch")
			punch_field.disabled = false


func _on_PunchField_body_entered(body):
	if body.is_in_group("Planks"):
		body.destroy()
