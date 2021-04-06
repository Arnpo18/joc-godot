extends KinematicBody2D

var velocitat=300
var moviment=Vector2()
var pilota
func direccio_pilota():
	if abs(pilota.position.y - position.y) > 20:
		if pilota.position.y > position.y: 
			return 1
		else: 
			return -1
	else: 
		return 0	
func _ready():
	pilota=get_parent().find_node('BOLA')
	position.y=300 # Replace with function body.
func _physics_process(delta):
	move_and_slide(Vector2(0,direccio_pilota())*velocitat)
	position.x=984
