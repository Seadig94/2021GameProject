extends KinematicBody2D

enum {
	IDLE,
	WANDER,
	CHASE
}

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = CHASE

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE
	
onready var sprite = $AnimatedSprite
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone
onready var hurtbox = $Hurtbox

func create_enemy_effect():
	var EnemyEffect = load("res://Resources/Effects/EnemyEffect.tscn")
	var enemyEffect = EnemyEffect.instance()
	var world = get_tree().current_scene
	world.add_child(enemyEffect)
	enemyEffect.global_position = global_position

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, 200 * delta)
			seek_player()
		WANDER:
			pass
			
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			sprite.flip_h = -velocity.x < 0
	velocity = move_and_slide(velocity)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120
	$AnimatedSprite.play("hit")
	yield ($AnimatedSprite,"animation_finished")
	$AnimatedSprite.play("move")
	hurtbox.create_hit_effect()

func _on_Stats_no_health():
	create_enemy_effect()
	queue_free()

