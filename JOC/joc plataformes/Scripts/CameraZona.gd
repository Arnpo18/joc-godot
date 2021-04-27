extends Position2D

var transition = false
var Zona1 = Vector2(960, 540)
var Zona2 = Zona1 + Vector2(1920, 0)
var Zona3 = Zona2 + Vector2(1920, 0)
var Zona4 = Zona3 + Vector2(1920, 0)


func _ready():
	position = Zona1

func _physics_process(delta):
	if $"/root/Global_Plataformes".mapa == 1:
		if position == Zona2:
#			.add_child("res://joc plataformes/Escenes/AngryPig.tscn")
			$Tween.interpolate_property(self,'position',position, Zona1, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 2:
		if position == Zona1 or position == Zona3:
			$Tween.interpolate_property(self,'position',position, Zona2, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 3:
		if position == Zona2 or position == Zona4:
			$Tween.interpolate_property(self,'position',position, Zona3, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
