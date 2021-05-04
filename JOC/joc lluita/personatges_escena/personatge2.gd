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
var aaa=false
func x():
	pass
func _ready():
	pass 
func _physics_process(delta):
	$TextureProgress.value=vida
	$espasa/CollisionShape2D.set_deferred('disabled',true)
	moviment.y+=gravetat*delta
	moviment.x=0
	if vida>0:
		mort=false
	else: 
		mort=true
		mortj()
		$mort.play()
	if aaa==true:
		moviment.x=0
	if mort==false && aaa==false:
		
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
				$espasa.scale.x=1
			if Input.is_action_pressed('esquerra_lluita2'):
				moviment.x=-velocitat
				$AnimatedSprite.play('camina')
				$AnimatedSprite.scale.x=-1
				$espasa.scale.x=-1
			if Input.is_action_just_pressed("salta_lluita2") && is_on_floor():
				moviment.y=-360
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
				$so_espasa.play()
			if Input.is_action_just_pressed('atac2_lluita2'):
				$AnimatedSprite.play('atac2')
				atacant=true
				$cooldown.start()
				atacar()
				$so_espasa.play()

	moviment=move_and_slide(moviment,Vector2.UP)
func _on_cooldown_timeout():
	atacant=false
func _on_espasa_body_entered(body):
	if body.has_method('rep_mal') :
		body.rep_mal() 
func rep_mal():
	vida-=50
	
func atacar():
	$espasa/CollisionShape2D.set_deferred('disabled',false)

func mortj():
	vida=400
	moviment.y=0
	position=Vector2(1656,464)
	mort=false
	gravetat=0
	$espera.start()
	vides-=1
	aaa=true
	
func _on_espera_timeout():
	gravetat=670
	aaa=false
