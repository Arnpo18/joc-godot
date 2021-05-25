extends Node2D

onready var AngryPig = preload("res://joc plataformes/Escenes/AngryPig.tscn")
onready var Bat = preload("res://joc plataformes/Escenes/Bat.tscn")


func _ready():
	pass

func _process(_delta):
	if $"/root/Global_Plataformes".Enemics_Zona1 == true:
		for child in get_children():
			remove_child(child)
		
		add_child(Bat.instance())
		
		$Bat.position = Vector2(1000, 191)
		
		$"/root/Global_Plataformes".Enemics_Zona1 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona2 == true:
		for child in get_children():
			remove_child(child)
		add_child(AngryPig.instance())
		$AngryPig.position = Vector2(3232, 919)
		
		$"/root/Global_Plataformes".Enemics_Zona2 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona3 == true:
		for child in get_children():
			remove_child(child)
		
		add_child(Bat.instance())
		$Bat.position = Vector2(1000 + 1920*2, 191)
		
		$"/root/Global_Plataformes".Enemics_Zona3 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona4 == true:
		for child in get_children():
			remove_child(child)
		
		add_child(Bat.instance())
		add_child(Bat.instance())
		
		for child in get_children():
			child.position = Vector2(7160, 660)
		$Bat.position = Vector2(900 + 1920*3, 191)
		
		$"/root/Global_Plataformes".Enemics_Zona4 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona5 == true:
		for child in get_children():
			remove_child(child)
		
		add_child(AngryPig.instance())
		add_child(AngryPig.instance())
		
		for child in get_children():
			child.position = Vector2(8320, 830)
		$AngryPig.position = Vector2(8960, 830)
		
		$"/root/Global_Plataformes".Enemics_Zona5 = false
		
		
	if $"/root/Global_Plataformes".final_ene == true:
		for child in get_children():
			remove_child(child)
		$"/root/Global_Plataformes".final_ene = false
