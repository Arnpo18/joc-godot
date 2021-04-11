extends KinematicBody2D
var gravetat = 670
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
	$AnimatedSprite/espasa/CollisionShape2D.set_deferred('disabled',true)
	moviment.y+=gravetat*delta
	moviment.x=0
	if vida>0:
		mort=false
	else: 
		mort=true
		mortj()
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
				$AnimatedSprite.play('camina')
				$AnimatedSprite.scale.x=1
			if Input.is_action_pressed('esquerra_lluita2'):
				moviment.x=-velocitat
				$AnimatedSprite.play('camina')
				$AnimatedSprite.scale.x=-1
			if Input.is_action_just_pressed("salta_lluita2") && is_on_floor():
				moviment.y=-340
			if is_on_floor()==false && moviment.y <0:
				$AnimatedSprite.play('salt')
			if is_on_floor()==false && moviment.y >0:
				$AnimatedSprite.play('cau')
			if moviment.x==0 && is_on_floor():
				$AnimatedSprite.play('quiet')

			if Input.is_action_just_pressed('atac1_lluita2'):
				$AnimatedSprite.play('atac')
				atacant=true
				$cooldown.start()
				atacar()
			if Input.is_action_just_pressed('atac2_lluita2'):
				$AnimatedSprite.play('atac')
				atacant=true
				$cooldown.start()
				atacar()

	moviment=move_and_slide(moviment,Vector2.UP)
func _on_cooldown_timeout():
	atacant=false
func _on_espasa_body_entered(body):
	if body.has_method('rep_mal') :
		body.rep_mal() 
func rep_mal():
	vida-=50
func atacar():
	$AnimatedSprite/espasa/CollisionShape2D.set_deferred('disabled',false)
	$alataque.start()
func _on_alataque_timeout():
	$AnimatedSprite/espasa/CollisionShape2D.set_deferred('disabled',true) # Replace with function body.
func mortj():
	$AnimatedSprite.play('mort')
	
	
func _on_mortt_timeout():
	vida=400
	position=Vector2(680,250)
	mort=false
	gravetat=0
	$espera.start()
	vides-=1
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.get_animation()=='mort':
		$mortt.start() # Replace with function body.


func _on_espera_timeout():
	gravetat=670
	
