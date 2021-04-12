extends KinematicBody2D

var velocitat = 800
var moviment = Vector2.ZERO

func _ready():
	position=Vector2(1920/2, 1080/2)
	randomize()
	moviment.x=[-1,1][randi() % 2]
	moviment.y=[-0.75,0.75][randi() % 2]
	
func _physics_process(delta):	
	var colisio=move_and_collide(moviment*velocitat*delta)
	if colisio:
		moviment= moviment.bounce(colisio.normal)
	
func bola():
	pass
func parar():
	velocitat=0
func moure():
	velocitat=800
	moviment.x=[-1,1][randi() % 2]
	moviment.y=[-0.75,0.75][randi() % 2]
