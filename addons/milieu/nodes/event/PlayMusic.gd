extends Event
class_name PlayMusic, "res://addons/milieu/icons/PlayMusic.svg"

export(String, FILE) var sound_file

func run():
	var music = AudioStreamPlayer.new()
	music.stream = load(sound_file)
	Milieu.add_child(music)
	music.play()
	Milieu.playing = music
	emit_signal("finished")
