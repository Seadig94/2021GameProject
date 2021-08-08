extends KinematicBody2D

var speed = 80
var motion = Vector2.ZERO
var player = null

func _physics_process(delta):
	
	if player:
		var d = global_position.distance_to(player.global_position)
		print("d",d)
		if d > 20:
			motion = position.direction_to(player.position) * speed
			motion = move_and_slide(motion)


func _on_Area2D_body_entered(body):
	print("entered")
	if body.is_in_group("Player"):
		player = body

#
#func _on_Area2D_body_exited(body):
#	print("exit")
#	player = null
