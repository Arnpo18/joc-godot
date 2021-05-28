extends Camera2D

var shaking = false

func _ready():
	Global.Camera = self
	pass 

func _process(delta):
	
	if shaking:
		shake()
		shaking = false
	else:
		offset = Vector2(0,0)
	
	pass
	
func shake():
	var xy = Vector2(
		rand_range(-2.0, 2.0),
		rand_range(-2.0, 2.0)
	)
	offset = xy
	
	pass
