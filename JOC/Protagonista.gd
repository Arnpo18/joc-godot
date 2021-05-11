extends KinematicBody2D

var animacio_inicial = false
var animacio_final = false

var velocitat : Vector2
var salt_aeri = false
var gravetat = 1000
var moviment = 150
var salt = 600
var segon_salt = 550

func _ready():
	$AnimacioInicial.start()
	$AnimatedSprite.play('Appearing')

#	print(collision_layer)
#	print(collision_mask)

func _physics_process(delta):
	if animacio_inicial == true and animacio_final == false:
		
		# Caiguda
		if position.y > 1200:
			mal()
		
		# Moviment del jugador
		velocitat.x = 0
		if Input.is_action_pressed("dreta_plataformes"):
			velocitat.x = moviment
			$AnimatedSprite.flip_h = false
		if Input.is_action_pressed("esquerra_plataformes"):
			velocitat.x = -moviment
			$AnimatedSprite.flip_h = true
		if Input.is_action_just_pressed("salta_plataformes"):
			if is_on_floor():
				velocitat.y = -salt
				$AnimatedSprite.play('Jump')
			elif salt_aeri == true:
				velocitat.y = -segon_salt
				salt_aeri = false
				$AnimatedSprite.play('Double Jump')
		
		if is_on_floor():
			salt_aeri = true
		
		velocitat.y += gravetat*delta
		
		velocitat = move_and_slide(velocitat, Vector2.UP)
		
		anima(velocitat)
		zona()
	
	if Input.is_action_just_pressed("ui_accept"):
		mal()

func anima(velocitat):
	if velocitat == Vector2.ZERO:
		$AnimatedSprite.play('Idle')
	if velocitat.y > 0:
		$AnimatedSprite.play('Fall')
	if velocitat.x != 0 and velocitat.y == 0:
		$AnimatedSprite.play('Run')

func _on_AnimacioInicial_timeout():
	animacio_inicial = true


func mal():
	animacio_final = true
	$AnimatedSprite.play('Disappearing')
	$AnimacioFinal.start()

func zona():
	if position.x > 0 and position.x < 1920:
		$"/root/Global_Plataformes".mapa = 1
	if position.x > 1920 and position.x < 3840:
		$"/root/Global_Plataformes".mapa = 2
	if position.x > 3840 and position.x < 5760:
		$"/root/Global_Plataformes".mapa = 3
	if position.x > 5760 and position.x < 7680:
		$"/root/Global_Plataformes".mapa = 4


func _on_Mort_body_entered(body):
	print('ha entrat')
	print(body.collision_layer)
#	if body.has_method('matar'):
#		print('Holiwi')
#		mal()
#	if body.collision_layer == 2:
#		mal()



func _on_AnimacioFinal_timeout():
	$"/root/Global_Plataformes".respawn = true
