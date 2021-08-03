#Startmenu.gd
extends Control

func _on_TextureButton_pressed():
	var musicNode = $select
	musicNode.play()
	print("hi")

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_select_finished() -> void:
	get_tree().change_scene("res://STORY.tscn")
