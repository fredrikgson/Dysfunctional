extends StaticBody2D

export(bool) var start_active = false

onready var anim = $AnimationPlayer
onready var coll_shape = $CollisionShape2D

func _ready():
	if start_active:
		anim.play("On")
		coll_shape.disabled = true
	else:
		anim.play("Off")
		coll_shape.disabled = false

func activating_anim_complete():
	coll_shape.disabled = true
func deactivating_anim_complete():
	coll_shape.disabled = false


# these get triggered from the panel
func activate():
	anim.play("Activating")
func deactivate():
	anim.play("Deactivating")
