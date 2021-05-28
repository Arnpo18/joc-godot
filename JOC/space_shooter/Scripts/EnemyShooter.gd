extends "res://space_shooter/Scripts/Enemy.gd"


const LaserScene = preload("res://space_shooter/Scenes/Laser_enemy.tscn")

var can_shoot = true

func _ready():
	vel.x = Utils.choose([vel.x, -vel.x])
	add_to_group("Enemy")
	pass 

func _process(delta):
	if position.x <= 0 + 16:
		vel.x = abs(vel.x)
	if position.x >= Utils.view_size.x - 16:
		vel.x = -abs(vel.x)
		
	if Armor <= 0:
		Global.Camera.shaking = true
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimatedSprite.play("Explosioxd")
		can_shoot = false
	
	pass
	

func shoot():
	if can_shoot:
		var Laser = LaserScene.instance()
		Laser.position = get_node("Cannon").global_position
		get_tree().get_root().add_child(Laser)
	pass


func _on_ShootTimer_timeout():
	
	shoot()
	
	pass

func set_armor(new_armor):
	if new_armor < Armor:
		Global.EnemyHit.play()
	Armor = new_armor
	if Armor <= 0:
		Global.Explosion.play()
		Global.Score_spr.Score += 5
		$CollisionShape2D.set_deferred("disabled", true)
		Global.Camera.shaking = true
		$AnimatedSprite.play("Explosioxd")
	
		
 
	
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Explosioxd":
		Global.Camera.shaking = false
		queue_free()


func _on_EnemyShooter_body_entered(body):
	
	if body.is_in_group("Ship"):
		body.Armor -= 1
		Global.Camera.shaking = true
		Armor = 0
	pass
