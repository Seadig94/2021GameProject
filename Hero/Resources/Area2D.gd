extends Area2D


func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
		get_tree().change_scene("res://Worlds/ThingTransition.tscn")
