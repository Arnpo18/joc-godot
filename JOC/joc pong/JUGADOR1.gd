extends KinematicBody2D

var velocitat=420
var moviment=Vector2()

func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	moviment.y=0
	position.x=0
	if Input.is_action_pressed("amunt"):
		moviment.y=-velocitat
	if Input.is_action_pressed("avall"):
		moviment.y=velocitat
	moviment=move_and_slide(moviment)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

