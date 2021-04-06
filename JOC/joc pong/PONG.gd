extends Node2D
var puntuacioj1=0
var puntuacioj2=0
func _ready():
	puntuacioj1=0
	puntuacioj2=0
func _process(delta):
	$PUNTUACIOJ1.text=str(puntuacioj1)
	$PUNTUACIOJ2.text=str(puntuacioj2)

func _on_porteria_j1_body_entered(body):
	if body.has_method('bola'):
		puntuacioj2+=1
		$BOLA.position=Vector2(512, 300)
		get_tree().call_group('mibola','parar')
		$Timer.start()
func _on_porteria_j2_body_entered(body):
	if body.has_method('bola'):
		puntuacioj1+=1
		$BOLA.position=Vector2(512, 300)
		get_tree().call_group('mibola','parar')
		$Timer.start()
func _on_Timer_timeout():
	get_tree().call_group('mibola','moure')
