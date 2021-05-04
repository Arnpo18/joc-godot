extends Node


var debug = false
var mapa = ["res://joc lluita/mapes/mapa1.tscn","res://joc lluita/mapes/mapa2.tscn"]
var ansp = [ "res://joc lluita/personatges/caballer_1.tscn","res://joc lluita/personatges/caballer_2.tscn","res://joc lluita/personatges/samurai.tscn","res://joc lluita/personatges/caçadora.tscn","res://joc lluita/personatges/reina.tscn"]
var ansp1
var ansp2
var map

func _ready():
	
	ansp1 = load(ansp[GlobalLluita.personatge1])
	ansp1=ansp1.instance()
	$personatge1.add_child(ansp1)
	ansp2 = load(ansp[GlobalLluita.personatge2])
	ansp2=ansp2	.instance()
	$personatge2.add_child(ansp2)
	$personatge1.position=Vector2(32,368)
	$personatge2.position=Vector2(1656,464)
	$Camera2D.add_target($personatge1)
	$Camera2D.add_target($personatge2)
	
func _process(delta):
	if $personatge1.vides==2:
		$CanvasLayer2/jugador1/vida3.hide()
	if $personatge1.vides==1:
		$CanvasLayer2/jugador1/vida2.hide()
	if $personatge1.vides==0:
		guanya_j2()
		$CanvasLayer2/jugador1/vida1.hide()
	if $personatge2.vides==2:
		$CanvasLayer2/jugador2/vida1.hide()
	if $personatge2.vides==1:
		$CanvasLayer2/jugador2/vida2.hide()
	if $personatge2.vides==0:
		guanya_j1()
		$CanvasLayer2/jugador2/vida3.hide()
		
	
	

func _on_Area2D_body_entered(body):
	if body.has_method('rep_mal'):
		body.vida=0
func guanya_j1():
	$Camera2D.zoom.x=1
	$Camera2D.zoom.y=1
	get_tree().paused
	$vj1.show()
	$personatge1.position=Vector2(32,368)
	$personatge2.position=Vector2(1656,464)
	$Timer3.start()

func _on_Timer3_timeout():
	get_tree().paused = not get_tree().paused
	$menu_pausa.show()
func guanya_j2():
	$Camera2D.zoom.x=1
	$Camera2D.zoom.y=1
	get_tree().paused
	$vj2.show()
	$personatge1.position=Vector2(32,368)
	$personatge2.position=Vector2(1656,464)
	$Timer3.start()
