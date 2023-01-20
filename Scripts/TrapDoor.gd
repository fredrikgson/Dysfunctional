extends StaticBody2D

export(bool) var is_open = false
onready var sprite = $Sprite
onready var coll_shape = $CollisionShape2D

func _ready():
	if is_open:
		open()
	else:
		close()


func open():
	sprite.frame = 1
	is_open = true
	coll_shape.call_deferred("set_disabled", true)

func close():
	sprite.frame = 0
	is_open = false
	coll_shape.call_deferred("set_disabled", false)

func toggle():
	if is_open:
		close()
	else:
		open()
