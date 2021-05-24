extends RigidBody2D




func _on_Area2D_body_entered(body):
	if body.is_in_group('personatge'):
		body.vida+=100
		if body.vida>400:
			body.vida=400
		queue_free()
