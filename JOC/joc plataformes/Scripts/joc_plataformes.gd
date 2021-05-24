extends Node2D

onready var Protagonista = preload("res://joc plataformes/Escenes/Protagonista.tscn")

func _ready():
	pass


func _process(_delta):
	if $"/root/Global_Plataformes".respawn == true:
		
		remove_child($Protagonista)
		
		add_child(Protagonista.instance())
		$Protagonista.position = Vector2(120+1920*($"/root/Global_Plataformes".mapa-1), 800)
		
		if $Protagonista.position.x == 120:
			$"/root/Global_Plataformes".Enemics_Zona1 = true
		elif $Protagonista.position.x == 120 + 1920:
			$"/root/Global_Plataformes".Enemics_Zona2 = true
		elif $Protagonista.position.x == 120 + 1920*2:
			$"/root/Global_Plataformes".Enemics_Zona3 = true
		elif $Protagonista.position.x == 120 + 1920*3:
			$Protagonista.position.y -= 300
			$"/root/Global_Plataformes".Enemics_Zona4 = true
		elif $Protagonista.position.x == 120 + 1920*4:
			$Protagonista.position.y -= 100
			$"/root/Global_Plataformes".Enemics_Zona5 = true
		
		$"/root/Global_Plataformes".respawn = false
		
		
	if $"/root/Global_Plataformes".final_prota == true:
		remove_child($Protagonista)
		$"You Win".visible = true
		$"/root/Global_Plataformes".final_prota = false
