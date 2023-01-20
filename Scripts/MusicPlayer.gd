extends Node2D

var title_screen_BGM = preload("res://Audio/Music/Title_BGM.wav")
var in_game_BGM = preload("res://Audio/Music/BGM.wav")
var game_completed_BGM = preload("res://Audio/Music/game_completed_jingle.wav")
onready var asp = $AudioStreamPlayer
onready var death_asp = $DeathSoundPlayer
onready var anim = $AnimationPlayer

### REMOVE THIS, ONLY FOR TESTING LV10
#func _ready():
#	play_game_BGM()
###

func play_title_BGM():
	asp.stream = title_screen_BGM
	asp.play()

func play_game_BGM():
	asp.stream = in_game_BGM
	asp.play()

func stop_BGM():
	anim.play("SmoothMute")

func smooth_mute_complete():
	asp.stop()

func play_game_completed_jingle():
	asp.volume_db = -12
	asp.stream = game_completed_BGM
	asp.play()

func play_death_sound():
	death_asp.play()
