extends Sprite

func _process(delta):
	if PlayerStats.health<= 0 :
		$HeroPortrait.play("HeroDead")
	elif PlayerStats.health <= 2:
		$HeroPortrait.play("HeroHurt")	
	elif PlayerStats.health >= 2:
			$HeroPortrait.play("HeroNormal")
