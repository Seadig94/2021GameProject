extends Sprite

func _ready():
	var musicNode = $ThingSound
	musicNode.play()


func _on_ThingSound_finished():
		get_tree().change_scene("res://Worlds/World.tscn")
