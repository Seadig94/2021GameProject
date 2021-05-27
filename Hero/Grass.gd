extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var GrassEffect = load("res://GrassEffect.tscn")
		var grassEffect = GrassEffect.instanced()
		
		queue_free()
