extends Area2D



func _on_Bau_body_entered(body):
	print("tiro no bau")
	if body.nome == "atr1":
		Global.pontosAti1 += 10
	elif body.nome == "atr2":
		Global.pontosAti2 += 10
	
	body.queue_free()
	queue_free()
