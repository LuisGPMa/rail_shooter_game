extends Area2D



func _on_Bau_body_entered(body):
	print("tiro no bau")
	if body.nome == "atr1":
		if Global.pontosAti1 >= Global.VIDA_MAX:
			Global.pontosAti1 = Global.VIDA_MAX
		else: 
			Global.pontosAti1 += 10 
	elif body.nome == "atr2":
		if Global.pontosAti2 >= Global.VIDA_MAX:
			Global.pontosAti2 = Global.VIDA_MAX
		else: 
			Global.pontosAti2 += 10
	
	body.queue_free()
	queue_free()
