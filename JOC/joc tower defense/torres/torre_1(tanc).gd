extends Area2D
var bala = preload("res://joc tower defense/torres/bala.tscn")
var distancia_de_t
var targetejant
var RADIUS = 42
var enemics = []
var target_actual
var posicio_target
func _ready():
	pass 
func _on_rang_area_entered(area):
	if area.is_in_group('enemic'):
		enemics.append(area.get_parent()) 
func _on_rang_area_exited(area):
	if area.is_in_group('enemic'):
		enemics.erase(area.get_parent()) 
func _physics_process(delta):
	pass
