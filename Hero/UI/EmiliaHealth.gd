extends Control

var Emiliahearts = 100 setget set_hearts
var Emiliamax_hearts = 100 setget set_max_hearts

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty

func set_hearts(value):
	Emiliahearts = clamp(value, 0, Emiliamax_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = Emiliahearts * 1.21

func set_max_hearts(value):
	Emiliamax_hearts = max(value, 1)
	self.Emiliahearts = min(Emiliahearts, Emiliamax_hearts)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = Emiliamax_hearts * 1.21
	
func _ready():
	self.Emiliamax_hearts = PlayerStats.max_health
	self.Emiliahearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	
