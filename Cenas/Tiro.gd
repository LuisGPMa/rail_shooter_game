extends KinematicBody2D

export var velocidade = 300

func _physics_process(delta):
	move_and_collide(transform.x.normalized() * delta * velocidade)
	pass
	
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		
		if body.name == "Atirador 2":
			Global.pontosAti2 -= 10
			queue_free()
		
		if body.name == "Atirador1":
			Global.pontosAti1 -= 10
			queue_free()
		
		print(body.name)
		print("Tiro Recebido")
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
