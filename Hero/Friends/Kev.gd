extends KinematicBody2D

var speed = 79
var motion = Vector2.ZERO
var player = null

var velocity = Vector2.ZERO

onready var animationPlayerKev = $AnimationPlayerKev
onready var animationTreeKev = $AnimationTreeKev

onready var animationState = animationTreeKev.get("parameters/playback")

func _physics_process(delta):
	
	
	if player:
		var d = global_position.distance_to(player.global_position)
		print("d",d)
		if d > 40:
			motion = position.direction_to(player.position) * speed
			motion = move_and_slide(motion)
			animationTreeKev.set("parameters/KevRun/blend_position", motion)
			animationState.travel("KevRun")
		else:
			animationTreeKev.set("parameters/KevIdle/blend_position", motion)
			animationState.travel("KevIdle")


func _on_KevFollow_body_entered(body):
	print("entered")
	if body.is_in_group("Player"):
		player = body

