extends Position2D

var Zona1 = Vector2(960, 540)
var Zona2 = Zona1 + Vector2(1920, 0)

func _ready():
	position = Zona1

func _physics_process(delta):
	$Label.text = str($Tween.is_active())
	if $"/root/Global_Plataformes".mapa == 1:
		if not $Tween.is_active():
			$Tween.interpolate_property(self,'position',position, Zona1, 2,Tween.TRANS_LINEAR)
			$Tween.start()

	if $"/root/Global_Plataformes".mapa == 2:
		if not $Tween.is_active():
			$Tween.interpolate_property(self,'position',position, Zona2, 2,Tween.TRANS_LINEAR)
			$Tween.start()
