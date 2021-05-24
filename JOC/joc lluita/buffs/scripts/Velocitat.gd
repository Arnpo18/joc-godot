extends RigidBody2D

var v1
var v2


func _on_Area2D_body_entered(body):
	if body.is_in_group('personatge'):
		body.velocitat()
		queue_free()
