extends Node


var debug = false


func _ready():
	$Camera2D.add_target($personatge1)
	$Camera2D.add_target($personatge2)


func _process(delta):
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
