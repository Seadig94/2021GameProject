extends Control

func _on_TextureButton_pressed():
	var musicNode = $select
	musicNode.play()
	var animationNode = $AnimationPlayer
	animationNode.play("FadeOut")
	


func _on_QuitButton_pressed():
	get_tree().quit()

func _ready():
	var musicNode = $music
	musicNode.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://World.tscn")
