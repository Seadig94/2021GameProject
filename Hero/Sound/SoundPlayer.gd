extends Node
onready var warning = AudioStreamPlayer.new()
onready var music_player = AudioStreamPlayer.new()
func warning_sound(sound):
	warning.stream = load(sound)
	warning.play()

func _ready():
	self.add_child(warning)
	self.add_child(music_player)

func play(sound):
	var audio_stream = AudioStreamPlayer.new()
	self.add_child(audio_stream)
	audio_stream.stream = load(sound)
	audio_stream.play()
	
func change_music(song):
	music_player.stream = load(song)
	music_player.play()
