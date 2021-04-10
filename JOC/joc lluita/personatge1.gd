extends KinematicBody2D
const gravetat = 670
var moviment=Vector2()
var velocitat=300
var atacant=false
var velocitat2 = 100
var vida= 400
var vides=3
var mort = false
func x():
	pass
func _ready():
	pass 

func _physics_process(delta):
	moviment.y+=gravetat*delta
	moviment.x=0
	if vida <=0:
		mort=true
	if mort==false:
		if atacant==true:
			if Input.is_action_pressed('dreta_lluita'):
				moviment.x=velocitat2
			if Input.is_action_pressed('esquerra_lluita'):
				moviment.x=-velocitat2

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

			if Input.is_action_just_pressed("salta_lluita") && is_on_floor():
				moviment.y=-340
			if is_on_floor()==false && moviment.y <0:
				$AnimatedSprite.play('salt')
			if is_on_floor()==false && moviment.y >0:
				$AnimatedSprite.play('cau')

			if moviment.x==0 && is_on_floor():
				$AnimatedSprite.play('quiet')

										### atac ###
			if Input.is_action_just_pressed('atac1_lluita'):
				$AnimatedSprite.play('atac')
				atacant=true
				$cooldown.start()

			if Input.is_action_just_pressed('atac2_lluita'):
				$AnimatedSprite.play('atac2')
				atacant=true
				$cooldown.start()
	elif mort==true:
		mort()
		
	moviment=move_and_slide(moviment,Vector2.UP)

func _on_cooldown_timeout():
	atacant=false
func _on_hitbox_dreta_body_entered(body):
	if body.has_method('x') && atacant==true:
		body.vida-=50
func _on_hitbox_esquerra_body_entered(body):
	if body.has_method('x') && atacant==true:
		body.vida-=50
func mort():
	$AnimatedSprite.play('mort')
	$mort.start()
	vides-=1
	vida=400

func _on_mort_timeout():
	mort=false # Replace with function body.
