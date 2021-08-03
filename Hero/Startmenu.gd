#Startmenu.gd
extends Control

func _on_TextureButton_pressed():
	var musicNode = $select
	musicNode.play()
	var animationNode = $AnimationPlayer
	animationNode.play()
	print("hi")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_select_finished():
	get_tree().change_scene("res://World.tscn")

func _ready():
	var musicNode = $music
	musicNode.play()
