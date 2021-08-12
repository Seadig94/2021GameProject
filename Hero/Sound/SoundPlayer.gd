extends Node
onready var warning = AudioStreamPlayer.new()

func warning_sound(sound):
	if warning.playing == false:
		warning.stream = load(sound)
		warning.play()

func _ready():
	self.add_child(warning)

func play(sound):
	var audio_stream = AudioStreamPlayer.new()
	self.add_child(audio_stream)
	audio_stream.stream = load(sound)
	audio_stream.play()
