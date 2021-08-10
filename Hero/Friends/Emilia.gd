extends KinematicBody2D

var speed = 79
var motion = Vector2.ZERO
var player = null

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree2

onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	
	
	if player:
		var d = global_position.distance_to(player.global_position)
		print("d",d)
		if d > 20:
			motion = position.direction_to(player.position) * speed
			motion = move_and_slide(motion)
			animationTree.set("parameters/EmiliaRun/blend_position", motion)
			animationState.travel("EmiliaRun")
		else:
			animationTree.set("parameters/EmiliaIdle/blend_position", motion)
			animationState.travel("EmiliaIdle")

func _on_Area2D_body_entered(body):
	print("entered")
	if body.is_in_group("Player"):
		player = body

#
#func _on_Area2D_body_exited(body):
#	print("exit")
#	player = null
