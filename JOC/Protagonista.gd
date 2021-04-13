extends KinematicBody2D

var velocitat : Vector2
var salt_aeri = 1
var anima_segonsalt : bool


func _ready():
	pass

func _process(delta):
	# Moviment del jugador
	velocitat.x = 0
	if Input.is_action_pressed("dreta_plataformes"):
		velocitat.x = 100
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("esquerra_plataformes"):
		velocitat.x = -100
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_pressed("salta_plataformes"):
		if is_on_floor():
			velocitat.y = -200
			$AnimatedSprite.play('Jump')
		elif salt_aeri == 1:
			velocitat.y = -150
			salt_aeri = 0
			$AnimatedSprite.play('Double Jump')
	
	if is_on_floor() and salt_aeri == 0:
		salt_aeri = 1
	
	velocitat.y += 100*delta
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)

func anima(velocitat):
	if velocitat == Vector2.ZERO:
		$AnimatedSprite.play('Idle')
	if velocitat.y > 0:
		$AnimatedSprite.play('Fall')
	if velocitat.x != 0 and velocitat.y == 0:
		$AnimatedSprite.play('Run')
