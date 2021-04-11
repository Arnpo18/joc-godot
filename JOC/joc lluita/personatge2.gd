extends KinematicBody2D
const gravetat = 670
var moviment=Vector2()
var velocitat=300
var atacant=false
var velocitat2 = 100
var vida=400
var vides=3
var mort=false
var atac=true
func x():
	pass
func _ready():
	pass 
func _physics_process(delta):
	moviment.y+=gravetat*delta
	moviment.x=0
	print(vida)
	if mort==false:
		if atacant==true:
			if Input.is_action_pressed('dreta_lluita2'):
				moviment.x=velocitat2
			if Input.is_action_pressed('esquerra_lluita2'):
				moviment.x=-velocitat2
		if atacant==false:
									### moviment ###
			if Input.is_action_pressed('dreta_lluita2'):
				moviment.x=velocitat
			if Input.is_action_pressed('esquerra_lluita2'):
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
			if Input.is_action_just_pressed("salta_lluita2") && is_on_floor():
				moviment.y=-340
			if is_on_floor()==false && moviment.y <0:
				$AnimatedSprite.play('salt')
			if is_on_floor()==false && moviment.y >0:
				$AnimatedSprite.play('cau')
			if moviment.x==0 && is_on_floor():
				$AnimatedSprite.play('quiet')

										### atac ###
			if Input.is_action_just_pressed('atac1_lluita2'):
				$AnimatedSprite.play('atac')
				atacant=true
				$cooldown.start()
			if Input.is_action_just_pressed('atac2_lluita2'):
				$AnimatedSprite.play('atac')
				atacant=true
				$cooldown.start()
		elif mort==true:
			mort()
	moviment=move_and_slide(moviment,Vector2.UP)

func _on_cooldown_timeout():
	atacant=false
func _on_hitbox_dreta_body_entered(body):
	if atacant==true && atac==true:
		body.vida-=50
		atac=false
		$cooldown2.start()
func _on_hitbox_esquerra_body_entered(body):
	if atacant==true && atac==true:
		body.vida-=50
		atac=false
		$cooldown2.start()
func mort():
	$AnimatedSprite.play('mort')
	$mort.start()
	vides-=1
	vida=400
func _on_cooldown2_timeout():
	atac=true # Replace with function body.
