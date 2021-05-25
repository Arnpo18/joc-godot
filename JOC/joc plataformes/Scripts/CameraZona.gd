extends Position2D


var Zona1 = Vector2(960, 540)
var Zona2 = Zona1 + Vector2(1920, 0)
var Zona3 = Zona2 + Vector2(1920, 0)
var Zona4 = Zona3 + Vector2(1920, 0)
var Zona5 = Zona4 + Vector2(1920, 0)


func _ready():
	position = Zona1

func _physics_process(_delta):
	if $"/root/Global_Plataformes".mapa == 1:
		if position == Zona2:
			$"/root/Global_Plataformes".Enemics_Zona1 = true
			$Tween.interpolate_property(self,'position',position, Zona1, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 2:
		if position == Zona1 or position == Zona3:
			$"/root/Global_Plataformes".Enemics_Zona2 = true
			$Tween.interpolate_property(self,'position',position, Zona2, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 3:
		if position == Zona2 or position == Zona4:
			$"/root/Global_Plataformes".Enemics_Zona3 = true
			$Tween.interpolate_property(self,'position',position, Zona3, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
	if $"/root/Global_Plataformes".mapa == 4:
		if position == Zona3 or position == Zona5:
			$"/root/Global_Plataformes".Enemics_Zona4 = true
			$Tween.interpolate_property(self,'position',position, Zona4, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 5:
		if position == Zona4:
			$"/root/Global_Plataformes".Enemics_Zona5 = true
			$Tween.interpolate_property(self,'position',position, Zona5, 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
	
