extends StaticBody2D

var particles = preload("res://Objects/Misc/PlankParticles.tscn")

func destroy():
	var new_particles = particles.instance()
	new_particles.position = self.get_global_position()
	get_tree().get_root().call_deferred("add_child", new_particles)
	queue_free()
