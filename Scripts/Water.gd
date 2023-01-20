extends Area2D

var splash = preload("res://Objects/Decoration/WaterSplash.tscn")
var splash_sounds = [
	preload("res://Audio/SFX/water_splash_1.wav"),
	preload("res://Audio/SFX/water_splash_2.wav"),
	preload("res://Audio/SFX/water_splash_3.wav")
]
onready var asp = $AudioStreamPlayer

func _on_Area2D_body_entered(body):
	if body.is_in_group("FamilyMember"):
		var new_splash = splash.instance()
		new_splash.position = Vector2(self.get_global_position().x, self.get_global_position().y + 2)
		get_tree().get_root().call_deferred("add_child", new_splash)
		play_random_splash_sound()


func play_random_splash_sound():
	var splashes = splash_sounds.duplicate()
	randomize()
	splashes.shuffle()
	asp.stream = splashes.front()
	asp.play()
