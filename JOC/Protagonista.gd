extends KinematicBody2D

var animacio_inicial = false
var velocitat : Vector2
var salt_aeri = false
var gravetat = 500
var moviment = 150
var salt = 400
var segon_salt = 350


func _ready():
	$AnimacioInicial.start()
	$AnimatedSprite.play('Appearing')

func _physics_process(delta):
	if animacio_inicial == true:
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

func anima(velocitat):
	if velocitat == Vector2.ZERO:
		$AnimatedSprite.play('Idle')
	if velocitat.y > 0:
		$AnimatedSprite.play('Fall')
	if velocitat.x != 0 and velocitat.y == 0:
		$AnimatedSprite.play('Run')

func _on_AnimacioInicial_timeout():
	animacio_inicial = true


func mal(quantitat):
	pass
