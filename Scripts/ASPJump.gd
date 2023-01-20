extends AudioStreamPlayer

export(Array, Resource) var jump_sounds

func play_random_jump_sound():
	var copy = jump_sounds.duplicate()
	randomize()
	copy.shuffle()
	stream = copy.front()
	play()
