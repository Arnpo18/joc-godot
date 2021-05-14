extends Node2D

onready var Protagonista = preload("res://joc plataformes/Escenes/Protagonista.tscn")

func _ready():
	pass


func _process(delta):
	if $"/root/Global_Plataformes".respawn == true:
		remove_child($Protagonista)
		
		add_child(Protagonista.instance())
		$Protagonista.position = Vector2(120+1920*($"/root/Global_Plataformes".mapa-1), 800)
		$"/root/Global_Plataformes".respawn = false
