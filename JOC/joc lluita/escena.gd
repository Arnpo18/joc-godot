extends Node
var debug = false
var mapa = ["res://joc lluita/mapes/mapa1.tscn","res://joc lluita/mapes/mapa2.tscn"]
var ansp = [ "res://joc lluita/personatges/caballer_1.tscn","res://joc lluita/personatges/caballer_2.tscn","res://joc lluita/personatges/samurai.tscn","res://joc lluita/personatges/caçadora.tscn","res://joc lluita/personatges/reina.tscn"]
var ansp1
var ansp2
var map
const poma = preload("res://joc lluita/buffs/poma.tscn")
const pollo = preload("res://joc lluita/buffs/pollo.tscn")
const boar = preload("res://joc lluita/buffs/boar.tscn")
const guindilla = preload("res://joc lluita/buffs/guindilla.tscn")
var buff
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
func _on_buff_timeout():
	randomize()
	var x = rand_range(0,1)
	if x < 0.25:
		buff = 1
	elif x < 0.5:
		buff = 2
	elif x < 0.75:
		buff = 3
	else: buff = 4
	
	if buff == 1:
		var b = poma.instance()
		randomize()
		var z = rand_range(0,1)
		if z < 0.20:
			b.global_position=Vector2(504,376)
			add_child(b)
		elif z < 0.40:
			b.global_position=Vector2(952,376)
			add_child(b)
		elif z <0.60:
			b.global_position=Vector2(184,276)
			add_child(b)
		elif z < 0.80:
			b.global_position=Vector2(1400,410)
			add_child(b)
		else:
			b.global_position=Vector2(1816,530)
			add_child(b)
	elif buff == 2:
		var b = pollo.instance()
		randomize()
		var z = rand_range(0,1)
		if z < 0.20:
			b.global_position=Vector2(504,376)
			add_child(b)
		elif z < 0.40:
			b.global_position=Vector2(952,376)
			add_child(b)
		elif z <0.60:
			b.global_position=Vector2(184,276)
			add_child(b)
		elif z < 0.80:
			b.global_position=Vector2(1400,410)
			add_child(b)
		else:
			b.global_position=Vector2(1816,530)
			add_child(b)
	elif buff == 3 :
		var b = boar.instance()
		randomize()
		var z = rand_range(0,1)
		if z < 0.20:
			b.global_position=Vector2(504,376)
			add_child(b)
		elif z < 0.40:
			b.global_position=Vector2(952,376)
			add_child(b)
		elif z <0.60:
			b.global_position=Vector2(184,276)
			add_child(b)
		elif z < 0.80:
			b.global_position=Vector2(1400,410)
			add_child(b)
		else:
			b.global_position=Vector2(1816,530)
			add_child(b)
	elif buff == 4 :
		var b = guindilla.instance()
		randomize()
		var z = rand_range(0,1)
		if z < 0.20:
			b.global_position=Vector2(504,376)
			add_child(b)
		elif z < 0.40:
			b.global_position=Vector2(952,376)
			add_child(b)
		elif z <0.60:
			b.global_position=Vector2(184,276)
			add_child(b)
		elif z < 0.80:
			b.global_position=Vector2(1400,410)
			add_child(b)
		else:
			b.global_position=Vector2(1816,530)
			add_child(b)

		
