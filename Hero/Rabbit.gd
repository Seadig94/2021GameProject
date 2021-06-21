extends KinematicBody2D

var knockback = Vector2.ZERO

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

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120
	

func _on_Stats_no_health():
	create_enemy_effect()
	queue_free()

