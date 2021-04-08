extends KinematicBody2D

var velocitat=420
var moviment=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	moviment.y=0
	position.x=966
	if Input.is_action_pressed("amunt2_pong"):
		moviment.y=-velocitat
	if Input.is_action_pressed("avall2_pong"):
		moviment.y=velocitat
	moviment=move_and_slide(moviment)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
