extends Area2D


var Vel = Vector2(0, 200)



func _ready():
	pass 



func _process(delta):
	translate (Vel * delta)
	if position.y >= Utils.view_size.y+49:
		queue_free()
		pass
	pass
