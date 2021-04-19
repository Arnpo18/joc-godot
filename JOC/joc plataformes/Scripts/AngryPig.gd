extends KinematicBody2D

var velocitat : Vector2
var gravetat = 200
var target : KinematicBody2D
var target_no : KinematicBody2D
var mov_dreta = false
var mov_esq = true
var quiet_1 = false
var quiet_2 = false
var moviment = 100

func _ready():
	$Caminar.start()


func _physics_process(delta):
	
	if target:
		$AnimatedSprite.play('Run')
		if target.position.x > position.x:
			velocitat.x = moviment*1.5
		if target.position.x < position.x:
			velocitat.x = -moviment*1.5
		if target.position.x - position.x == 100 or position.x - target.position.x == 100:
			velocitat.x = 0
		
	
	else:
		if mov_dreta == true:
			velocitat.x = moviment
		elif quiet_1 == true:
			velocitat.x = 0
		elif mov_esq == true:
			velocitat.x = -moviment
		elif quiet_2 == true:
			velocitat.x = 0
			
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = true
	if velocitat.x <= 0:
		$AnimatedSprite.flip_h = false
	
	velocitat.y += gravetat*delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)

func anima(velocitat):
	if not target:
		if velocitat.x == 0:
			$AnimatedSprite.play('Idle')
		if velocitat.x != 0:
			$AnimatedSprite.play('Walk')


func _on_Caminar_timeout():
	if mov_dreta == true:
		mov_dreta = false
		quiet_1 = true
	elif quiet_1 == true:
		quiet_1 = false
		mov_esq = true
	elif mov_esq == true:
		mov_esq = false
		quiet_2 = true
	elif quiet_2 == true:
		quiet_2 = false
		mov_dreta = true
	$Caminar.start()



func _on_Vision_body_entered(body):
	if body.has_method('mal'):
		target = body


func _on_Vision_body_exited(body):
	if body.has_method('mal'):
		target = target_no
