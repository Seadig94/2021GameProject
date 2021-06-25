extends KinematicBody2D

enum {
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = CHASE

onready var stats = $Stats

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
			velocity = velocity.move_toward()
	
		WANDER:
			pass
			
		CHASE:
			pass

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120
	$AnimatedSprite.play("hit")
	yield ($AnimatedSprite,"animation_finished")
	$AnimatedSprite.play("move")
	

func _on_Stats_no_health():
	create_enemy_effect()
	queue_free()

