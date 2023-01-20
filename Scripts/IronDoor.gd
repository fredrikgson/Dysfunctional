extends StaticBody2D

onready var coll_shape = $CollisionShape2D
onready var anim = $AnimationPlayer
onready var asp = $AudioStreamPlayer

func open(): # triggered from lever
	coll_shape.disabled = true
	anim.play("Opening")
	asp.play()

func opening_anim_complete():
	anim.play("Open")
