extends TileMap

func _ready():
	pass

func _process(delta):
	pass


func _on_Zona1_body_entered(body):
	if body.has_method('mal'):
		$"/root/Global_Plataformes".mapa = 1


func _on_Zona2_entrada_body_entered(body):
	if body.has_method('mal'):
		$"/root/Global_Plataformes".mapa = 2.1
