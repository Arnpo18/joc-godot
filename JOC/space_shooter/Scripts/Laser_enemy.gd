extends "res://space_shooter/Scripts/Laser.gd"

func _ready():
	
	pass 



func _on_Laser_body_entered(body):
	if body.is_in_group("Ship"):
		body.Armor -= 1
		create_flare()
		queue_free()
	pass
