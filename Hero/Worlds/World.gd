extends Node2D

func _ready():
	SoundPlayer.change_music("res://Sound/Music/OMORI OST - 017 Forest Chillin\' (mp3cut.net).mp3")


func _on_Area2D_area_shape_entered(area_id, area, area_shape, local_shape):
	get_tree().change_scene("res://Worlds/HerosHome.tscn")


func _on_HomeDoor_body_entered(body):
	if body.is_in_group("Player"):
		SoundPlayer.change_music("res://Sound/Music/OMORI OST - 017 Forest Chillin\' (mp3cut.net).mp3")
		get_tree().change_scene("res://Worlds/HerosHome.tscn")
		
