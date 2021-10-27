extends Node2D

func _ready():
#	var musicNode = $HomeMusic
#	musicNode.play()
	SoundPlayer.change_music("res://Sound/Music/OMORI OST - 003 Lost At A Sleepover (mp3cut.net).mp3")



func _on_Door_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Worlds/World.tscn")
