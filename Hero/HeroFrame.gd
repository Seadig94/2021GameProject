extends Sprite
var sound_played = false
func _process(delta):
	if PlayerStats.health<= 0 :
		$HeroPortrait.play("HeroDead")
	elif PlayerStats.health <= 25:
		$HeroPortrait.play("HeroHurt")
		if not sound_played:
			SoundPlayer.play("res://Sound/Low health sound.wav")
			sound_played = true
	elif PlayerStats.health >= 25:
		$HeroPortrait.play("HeroNormal")
		sound_played = false
