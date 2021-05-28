extends Area2D
var target=null
var velocitat = 1000
var steer_force = 250.0
var moviment = Vector2.ZERO
var acceleracio = Vector2.ZERO 


func seek():
	var steer=Vector2.ZERO
	if target:
		if is_instance_valid(target):
			if target.vida>0:
				var desired = (target.get_global_position() - get_global_position()).normalized() * velocitat
				steer = (desired-moviment).normalized()*steer_force
		else:
			queue_free()
	return steer	
func _process(delta):
	acceleracio+=seek()*8
	moviment+=acceleracio*delta
	moviment = moviment.clamped(velocitat)
	rotacio()
	position += moviment*delta
func set_target(nou_target):
	target = (nou_target)
	
func rotacio():
	if target:
		if is_instance_valid(target):
			var juan = target.global_position - global_position
			var selona = (atan2(juan.y,juan.x)  * 360)/(2*PI) + 90
			rotation_degrees=selona
		else:
			queue_free()

