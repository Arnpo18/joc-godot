extends Node2D

onready var AngryPig = preload("res://joc plataformes/Escenes/AngryPig.tscn")
onready var Bat = preload("res://joc plataformes/Escenes/Bat.tscn")

func _ready():
	pass

func _process(delta):
	if $"/root/Global_Plataformes".Enemics_Zona1 == true:
		for child in get_children():
			child.queue_free()
		add_child(Bat.instance())
		$Bat.position = Vector2(1000, 191)
		$Bat.collision_layer = 2
		$Bat.collision_mask = 4
		
		$"/root/Global_Plataformes".Enemics_Zona1 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona2 == true:
		for child in get_children():
			child.queue_free()
		add_child(AngryPig.instance())
		$AngryPig.position = Vector2(3232, 919)
		$AngryPig.collision_layer = 2
		$AngryPig.collision_mask = 4
		
		$"/root/Global_Plataformes".Enemics_Zona2 = false
		
		
	if $"/root/Global_Plataformes".Enemics_Zona3 == true:
		for child in get_children():
			child.queue_free()
		add_child(Bat.instance())
		$Bat.position = Vector2(1000 + 1920*2, 191)
		$Bat.collision_layer = 2
		$Bat.collision_mask = 4
		
		$"/root/Global_Plataformes".Enemics_Zona3 = false
