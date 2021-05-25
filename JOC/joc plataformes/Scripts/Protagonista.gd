extends KinematicBody2D

var velocitat : Vector2
var salt_aeri = 1


func _ready():
	$AnimatedSprite.play('Appearing')

func _process(delta):
	# Moviment del jugador
	if Input.is_action_pressed("dreta_plataformes"):
		velocitat.x = 100
	if Input.is_action_pressed("esquerra_plataformes"):
		velocitat.x = -100
	if Input.is_action_pressed("salta_plataformes"):
		velocitat.y = -100
	
	if is_on_floor() and salt_aeri == 0:
		salt_aeri = 1
#	velocitat.y += 100*delta
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)

func anima(velocitat):
	if velocitat == Vector2.ZERO:
		$AnimatedSprite.play('Idle')
	if velocitat.y > 0:
		$AnimatedSprite.play('Fall')
	if Input.is_action_just_pressed("salta_plataformes") and is_on_floor():
		$AnimatedSprite.play('Jump')
	if Input.is_action_just_pressed("salta_plataformes") and not is_on_floor() and salt_aeri == 1:
		$AnimatedSprite.play('Double Jump')
