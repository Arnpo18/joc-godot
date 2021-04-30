extends Node2D

onready var AngryPig = preload("res://joc plataformes/Escenes/AngryPig.tscn")

func _ready():
	pass

func _process(delta):
	if $"/root/Global_Plataformes".Enemics_Zona1 == true:
		add_child(AngryPig.instance())
		$AngryPig.position = Vector2(1000, 300)
		$"/root/Global_Plataformes".Enemics_Zona1 = false
	if $"/root/Global_Plataformes".Enemics_Zona2 == true:
		add_child(AngryPig.instance())
		$AngryPig.position = Vector2(2500, 300)
		$"/root/Global_Plataformes".Enemics_Zona2 = false
