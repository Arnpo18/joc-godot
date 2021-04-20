extends Node


var debug = false


func _ready():
	$Camera2D.add_target($personatge1)
	$Camera2D.add_target($personatge2)
	$personatge1.position=Vector2(24,552)
	$personatge2.position=Vector2(1306,600)
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if body.has_method('rep_mal'):
		body.vida=0
