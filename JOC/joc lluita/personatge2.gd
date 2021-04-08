extends KinematicBody2D
const gravetat = 50
var moviment=Vector2()
var velocitat=350
var atacant=false
var xy
var vida=100
var a
var r
var tru =false
func _ready():
	xy=get_parent().find_node('personatge1')
	
func _physics_process(delta):
	if tru==false:
		$random.start()
		tru=true
		if r==1:
			atac()
		else: defensa()
	moviment.y+=gravetat

	
func atac():
	if abs(xy.position.x - position.x) > 0:
		if xy.position.x > position.x: a= 1
		else: a=-1 
	if a == 1:
		moviment=move_and_slide(Vector2(velocitat,moviment.y))
	else:
		moviment=move_and_slide(Vector2(-velocitat,moviment.y))
func defensa():
	if abs(xy.position.x - position.x) > 0:
		if xy.position.x > position.x: a=1
		else: a=-1
	if a==1:
		var yy=-1000
		moviment=move_and_slide(Vector2(-velocitat,yy))
		$Timer.start()
	if a==-1:
		var yy=-1000
		moviment=move_and_slide(Vector2(velocitat,yy))
		$Timer.start()
		
func _on_Timer_timeout():
	var yy=0 


func _on_random_timeout():
	randomize()
	r= [-1,1][randi() % 1]
	tru=false
