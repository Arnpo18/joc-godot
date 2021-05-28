extends "res://space_shooter/Scripts/PowerUp.gd"


func _ready():
	
	pass 



func _on_PowerUpLaser_body_entered(body):
	if body.is_in_group("Ship"):
		Global.PowerUp.play()
		body.is_double_shooting = true
		queue_free()
		pass
	pass 
