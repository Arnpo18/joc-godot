extends Area2D
var target=null
var velocitat = 1000
var steer_force = 200.0
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
	if target:
		acceleracio+=seek()*8
		moviment+=acceleracio*delta
		moviment = moviment.clamped(velocitat)
		position += moviment*delta
func set_target(nou_target):
	target = (nou_target)
	
	


