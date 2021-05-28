extends Node

const PowerUps = [
	preload("res://space_shooter/Scenes/PowerUp_Armor.tscn"),
	preload("res://space_shooter/Scenes/PowerUpLaser.tscn")
]



func _ready():
	yield(get_tree().create_timer(rand_range(10, 15)), "timeout") 
	spawn()
	
	pass

func spawn():
	while true:
		randomize()
		var PU = Utils.choose(PowerUps).instance()
		var pos = Vector2()
		pos.x = rand_range(0+49, get_viewport().get_visible_rect().size.x-49)
		pos.y = 0-49
		PU.set_position(pos)
		get_node("Container").add_child(PU)
		yield(get_tree().create_timer(rand_range(10, 15)), "timeout") 
	pass

