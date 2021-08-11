extends KinematicBody2D

var speed = 79
var motion = Vector2.ZERO
var player = null

var velocity = Vector2.ZERO

onready var animationPlayerYu = $AnimationPlayerYu
onready var animationTreeYu = $AnimationTreeYu

onready var animationState = animationTreeYu.get("parameters/playback")

func _physics_process(delta):
	
	
	if player:
		var d = global_position.distance_to(player.global_position)
		print("d",d)
		if d > 60:
			motion = position.direction_to(player.position) * speed
			motion = move_and_slide(motion)
			animationTreeYu.set("parameters/YuRun/blend_position", motion)
			animationState.travel("YuRun")
		else:
			animationTreeYu.set("parameters/YuIdle/blend_position", motion)
			animationState.travel("YuIdle")

	
func _on_YuFollow_body_entered(body):
	print("entered")
	if body.is_in_group("Player"):
		player = body

