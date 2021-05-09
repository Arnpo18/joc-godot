extends PathFollow2D
var velocitat=100
var vida = 5
func _ready():
	pass
	 
func _process(delta):
	$Label.text=str(vida)
	offset += velocitat * delta
	if offset >= 3000:
		final()
	if vida <= 0:
		final()
		GlobalTd.diners+=3
func final():
	queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group('bala'):
		vida -= 1
		area.queue_free()
