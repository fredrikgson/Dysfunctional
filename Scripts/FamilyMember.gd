extends KinematicBody2D
class_name FamilyMember

var member

var velocity = Vector2.ZERO
var facing_right = true

const GRAVITY = 5
const ACCELERATION = 5
const MAX_SPEED = 60
const FRICTION = 0.3
var JUMP_FORCE = 130
var busy = false

onready var anim = $AnimationPlayer
onready var sprite = $Sprite
onready var selection_arrow = $SelectionArrow
onready var asp_walking = $ASPWalking
onready var asp_jump = $ASPJump
onready var asp_select = $ASPSelect
onready var jump_particles = $JumpParticles

func _physics_process(delta):
	 # GRAVITY
	velocity.y += GRAVITY
	if is_on_floor() == false and busy == false:
		anim.play("Jump")
		asp_walking.stop()
	
	# INPUT MoVEMENT
	if member == GlobalData.currently_controlling:
		if Input.is_action_pressed("ui_left"):
			if facing_right:
				facing_right = false
				sprite.flip_h = true
			if is_on_floor() and busy == false: 
				anim.play("Run")
				if not asp_walking.is_playing(): asp_walking.play()
			if velocity.x > -MAX_SPEED: velocity.x -= ACCELERATION
		elif Input.is_action_pressed("ui_right"):
			if facing_right == false:
				facing_right = true
				sprite.flip_h = false
			if is_on_floor() and busy == false: 
				anim.play("Run")
				if not asp_walking.is_playing(): asp_walking.play()
			if velocity.x < MAX_SPEED: velocity.x += ACCELERATION
		else:
			# Stop moving
			if busy == false: anim.play("Idle")
			asp_walking.stop()
			velocity.x = lerp(velocity.x, 0, FRICTION)
	
		# JUMPING
		if Input.is_action_just_pressed("ui_up"):
			if is_on_floor(): 
				velocity.y -= JUMP_FORCE
				asp_jump.play_random_jump_sound()
				jump_particles.restart()
		
			
	
	else: # if not in control of this character
		# Stop moving
		anim.play("Idle")
		asp_walking.stop()
		velocity.x = lerp(velocity.x, 0, FRICTION)

	
	velocity = move_and_slide(velocity, Vector2.UP)
