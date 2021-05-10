extends TextureButton
var pop = false
var mesura = Vector2(100,100)
const cano_1 = preload("res://joc tower defense/torres/torre_1(tanc).tscn")
const cano_2 = preload("res://joc tower defense/torres/torre_2(tanc).tscn")
const missils_1 = preload("res://joc tower defense/torres/llença_míssils.tscn")
const missils_2 = preload("res://joc tower defense/torres/doble_llença_míssils.tscn")

func _ready():
	$GridContainer.hide()
	

func _process(delta):
	pass
func _on_TextureButton_pressed():
	if pop == false:
		$GridContainer.show()
		pop = true
	elif pop == true:
		pop=false
		$GridContainer.hide()

func _on_TextureButtona_pressed():
	if GlobalTd.diners>=5:
		var tanc=cano_1.instance()
		tanc.global_position=rect_global_position+Vector2(32,32)
		get_parent().add_child(tanc)
		queue_free()
	else:
		$Label.show()
		$Timer.start()

		
	 # Replace with function body.


func _on_TextureButton2_pressed():
	var tanc=cano_2.instance()
	tanc.global_position=rect_global_position+Vector2(32,32)
	get_parent().add_child(tanc)
	queue_free() # Replace with function body.


func _on_TextureButton3_pressed():
	var llm=missils_1.instance()
	llm.global_position=rect_global_position+Vector2(32,32)
	get_parent().add_child(llm)
	queue_free() # Replace with function body.


func _on_Timer_timeout():
	$Label.hide() # Replace with function body.
