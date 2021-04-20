extends KinematicBody2D

var velocitat : Vector2
var velocitat_max = 100
var moviment = 10
var target : KinematicBody2D
var target_no : KinematicBody2D


func _ready():
	pass


func _physics_process(delta):
	
	if target:
		if target.position.x > position.x:
			velocitat.x += moviment*delta*10
		if target.position.x < position.x:
			velocitat.x += -moviment*delta*10
		
		if target.position.y > position.y:
			velocitat.y += moviment*delta*10
		if target.position.y < position.y:
			velocitat.y += -moviment*delta*10
	elif not is_on_ceiling():
		velocitat.y = -100
	else:
		velocitat = Vector2.ZERO
	
	if velocitat.x > velocitat_max:
		velocitat.x = velocitat_max
	elif velocitat.x < -velocitat_max:
		velocitat.x = -velocitat_max
	if velocitat.y > velocitat_max:
		velocitat.y = velocitat_max
	elif velocitat.y < -velocitat_max:
		velocitat.y = -velocitat_max
	
	velocitat = move_and_slide(velocitat, Vector2.UP)


func _on_Vision_body_entered(body):
	if body.has_method('mal'):
		target = body

func _on_Vision_body_exited(body):
	if body.has_method('mal'):
		target = target_no