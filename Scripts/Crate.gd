extends KinematicBody2D

var velocity = Vector2.ZERO
onready var death_box = $DeathBox/CollisionShape2D

const GRAVITY = 4

func _ready():
	death_box.disabled = true

func _physics_process(delta):
	if is_on_floor() == false: 
		velocity.y += GRAVITY
	
	if abs(velocity.y) >= 5:
		death_box.disabled = false
	else:
		death_box.disabled = true

	velocity.x = 0
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_DeathBox_body_entered(body):
	if body.is_in_group("FamilyMember"):
		DeathHandling.kill()
