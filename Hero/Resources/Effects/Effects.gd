extends Node

func _on_AnimatedSprite_animation_finished():
	queue_free() 


func _on_HitEffect_animation_finished():
	queue_free() 
