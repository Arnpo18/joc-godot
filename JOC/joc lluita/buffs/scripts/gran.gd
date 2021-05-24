extends RigidBody2D

var objective


func _on_Area2D_body_entered(body):
	if body.is_in_group('personatge'):
		objective=body
		body.scale=Vector2(2,2)
		body.normal()
		queue_free()


