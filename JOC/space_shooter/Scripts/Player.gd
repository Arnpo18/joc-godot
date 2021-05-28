extends KinematicBody2D

export var speed = 200
const LaserScene = preload("res://space_shooter/Scenes/Laser_ship.tscn")
const FlashScene = preload("res://space_shooter/Scenes/Flasho desu.tscn")
signal armor_change
export var Armor = 4 setget set_armor
var can_shoot = true
var CanBeHit = true
var CanMove = true
var is_double_shooting = false setget set_double_shooting
func _ready():
	set_process(true)
	add_to_group("Ship")
	shoot()
	Global.Player = self
	pass


func _process(delta):
	
	if CanMove:
		var motion = (get_global_mouse_position().x - position.x) * 0.5
		translate(Vector2(motion, 0))
	
	var view_size = get_viewport_rect().size
	position.x = clamp(position.x, 0+32, view_size.x - 32)
	
	if Armor <= 0:
		if Global.Score_spr.Score > Game.highscore:
			Game.highscore = Global.Score_spr.Score
			Game.guarda_resultat()
		can_shoot = false
		CanMove = false
		Global.Camera.shaking = true
		
	
	if $HitTimer.time_left > 0:
		Global.Camera.shaking = true
		
	get_parent().get_node("HUD/armorXD").frame = Armor
	if Armor <= 0:
		Global.Menu_button.show()
		
		pass
		
	pass

func create_laser(position):
	var laser = LaserScene.instance()
	laser.position = position
	#_get_main_node().add_child(laser)
	get_tree().get_root().add_child(laser)
	return laser
	
	pass
	
func shoot():
	if can_shoot:
		var left = get_node("Cannons/Left").global_position
		var right = get_node("Cannons/CoolerLeft").global_position
		create_laser(left)
		create_laser(right)
		Global.LaserShip.play()
		if is_double_shooting:
			var laser_left = create_laser(left)
			var laser_right = create_laser(right)
			laser_left.vel.x = -25
			laser_right.vel.x = 25
	pass

func set_armor(new_armor):
	if new_armor > 4: 
		Armor = 4
	if CanBeHit:
		emit_signal("armor_change", new_armor)
		if new_armor < Armor:
			Global.ShipHit.play()
			get_tree().get_root().add_child(FlashScene.instance())
		Armor = new_armor
		Global.Camera.shaking = true
		$HitTimer.start()
		$CollisionShape2D.set_deferred("disabled", true)
		CanBeHit = false
		if Armor <= 0:
			$CollisionShape2D.set_deferred("disabled", true)
			$AnimatedSprite.play("Death")
			Global.Explosion.play()
		
	
	pass
func _on_ShootTimer_timeout():
	
	shoot()
	
	pass
	
	
#pito


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Death":
		Global.Camera.shaking = false
		queue_free()
	pass 


func _on_HitTimer_timeout():
	CanBeHit = true
	$CollisionShape2D.set_deferred("disabled", false)
	pass
	
func set_double_shooting(new_value):
	is_double_shooting = new_value
	if is_double_shooting:
		$DoubleShooting.start()
	pass


func _on_DoubleShooting_timeout():
	is_double_shooting = false
	pass 
