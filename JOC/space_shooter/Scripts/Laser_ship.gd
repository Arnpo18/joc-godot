extends "res://space_shooter/Scripts/Laser.gd"




func _ready():
	
	pass 


func _on_Laser_ship_area_entered(area):
	if area.is_in_group("Enemy"):
		area.Armor -= 1
		create_flare()
		queue_free()
	pass
