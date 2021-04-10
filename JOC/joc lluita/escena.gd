extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.
func _process(delta):
	if abs($personatge1.position.x-$personatge2.position.x) > 400:
		$KinematicBody2D/Camera2D.zoom.x = 0.5
		$KinematicBody2D/Camera2D.zoom.y = 0.5
	if abs($personatge1.position.x-$personatge2.position.x) > 550:
		$KinematicBody2D/Camera2D.zoom.x = 0.7
		$KinematicBody2D/Camera2D.zoom.y = 0.7
	if abs($personatge1.position.x-$personatge2.position.x) > 750:
		$KinematicBody2D/Camera2D.zoom.x = 0.85
		$KinematicBody2D/Camera2D.zoom.y = 0.85
	if abs($personatge1.position.x-$personatge2.position.x) > 900:
		$KinematicBody2D/Camera2D.zoom.x = 1
		$KinematicBody2D/Camera2D.zoom.y = 1
	$KinematicBody2D.position.x = (abs($personatge1.position.x+$personatge2.position.x)/2)
	$KinematicBody2D.position.y = (abs($personatge1.position.y+$personatge2.position.y)/2) +200
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
