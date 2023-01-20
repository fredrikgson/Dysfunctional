extends CanvasLayer

onready var anim = $BlackScreen/AnimationPlayer
var intro_cutscene = "res://Levels/IntroCutscene.tscn"

func _ready():
	MusicPlayer.play_title_BGM()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		anim.play("FadeOutScene")

func fade_out_finished():
	GlobalData.currently_controlling = null
	MusicPlayer.play_game_BGM()
	get_tree().change_scene(intro_cutscene)
