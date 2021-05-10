extends PathFollow2D
var velocitat=60
var vida = 60
func _ready():
	pass
	 
func _process(delta):
	$Label.text=str(vida)
	offset += velocitat * delta
	if offset >= 3000:
		final()
	if vida <= 0:
		final()
		
func final():
	queue_free()
	GlobalTd.diners+=10

func _on_Area2D_area_entered(area):
	if area.is_in_group('bala'):
		vida -= 1
		area.queue_free()
	if area.is_in_group('míssil'):
		vida -= 3
		area.queue_free()
