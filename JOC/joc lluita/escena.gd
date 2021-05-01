extends Node


var debug = false
var mapa = ["res://joc lluita/mapes/mapa1.tscn","res://joc lluita/mapes/mapa2.tscn"]
var ansp = [ "res://joc lluita/personatges/caballer_1.tscn","res://joc lluita/personatges/caballer_2.tscn","res://joc lluita/personatges/samurai.tscn","res://joc lluita/personatges/caçadora.tscn","res://joc lluita/personatges/reina.tscn"]
var ansp1
var ansp2
var map

func _ready():
	map = load("res://joc lluita/mapes/mapa1.tscn")
	map = map.instance()
	self.add_child(map)
	ansp1 = load(ansp[GlobalLluita.personatge1])
	ansp1=ansp1.instance()
	$personatge1.add_child(ansp1)
	ansp2 = load(ansp[GlobalLluita.personatge2])
	ansp2=ansp2	.instance()
	$personatge2.add_child(ansp2)
	$personatge1.position=Vector2(128,576)
	$personatge2.position=Vector2(1250,520)
	$Camera2D.add_target($personatge1)
	$Camera2D.add_target($personatge2)
	
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if body.has_method('rep_mal'):
		body.vida=0
