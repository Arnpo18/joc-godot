extends KinematicBody2D
const gravetat = 670
var moviment=Vector2()
var velocitat=200
var atacant=false

func x():
	pass
func _ready():
	pass 
	

func _physics_process(delta):
	moviment.y+=gravetat*delta
	moviment.x=0
	
		
	if atacant==false:
								### moviment ###
		if Input.is_action_pressed('dreta_lluita'):
			moviment.x=velocitat
		if Input.is_action_pressed('esquerra_lluita'):
			moviment.x=-velocitat
		if moviment.x > 0:
			$AnimatedSprite.play('camina')
			$AnimatedSprite.flip_h=false
			$hitbox_dreta/CollisionShape2D.set_deferred('disabled',false)
			$hitbox_esquerra/CollisionShape2D2.set_deferred('disabled',true)
		if moviment.x <0:
			$AnimatedSprite.play('camina')
			$AnimatedSprite.flip_h=true
			$hitbox_dreta/CollisionShape2D.set_deferred('disabled',true)
			$hitbox_esquerra/CollisionShape2D2.set_deferred('disabled',false)
		if Input.is_action_just_pressed("salta_lluita"):
			moviment.y=-250
		if is_on_floor()==false && moviment.y <0:
			$AnimatedSprite.play('salt')
		if moviment.x==0 && is_on_floor():
			$AnimatedSprite.play('quiet')

									### atac ###
		if Input.is_action_just_pressed('atac1_lluita'):
			$AnimatedSprite.play('atac')
			atacant=true
			$cooldown.start()
		
	moviment=move_and_slide(moviment,Vector2.UP)

func _on_cooldown_timeout():
	atacant=false

func _on_hitbox_dreta_body_entered(body):
	if body.has_method('_physics_process'):
		if body.has_method('x'):
			pass
		elif atacant==true:
			body.vida-=50
	
