extends KinematicBody2D

export var velocidade = 500
	
var atirador: int
var nome = ""	

func _physics_process(delta):
	move_and_collide(transform.x.normalized() * delta * velocidade)
	pass
	
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		
		if body.name == "Atirador 2" and Global.pontosAti2 > 0:
			print(body.name)
			print("Tiro Recebido atirador 2")
			Global.pontosAti2 -= 10
			queue_free()
		
		if body.name == "Atirador 1" and Global.pontosAti1 > 0: 
			Global.pontosAti1 -= 10
			print(body.name)
			print("Tiro Recebido atirador 1")
			queue_free()
			
		if "vida" in body.name:
			print("acertou_baú_vida")
			Global.curaJogador(atirador)
			body.queue_free()
			queue_free()
		
		
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
