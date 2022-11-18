extends Node

var pontosAti1 = 10
var pontosAti2 = 10
var vencedor = ""
var perdedor = ""
var fase = 0
var scoreAtirador1 = 0
var scoreAtirador2 = 0

func _ready():
	pass

func restaurar():
	pontosAti1 = 10
	pontosAti2 = 10

func trocarDeCena():
	if Global.pontosAti1 == 0 or Global.pontosAti2 == 0:
		if Global.pontosAti1 == 0:
			Global.vencedor = "Atirador 2 venceu" 
			Global.perdedor = "Atirador 1 perdeu"	
			#Global.fase = 2
			scoreAtirador2 += 1
		elif Global.pontosAti2 == 0:
			Global.vencedor = "Atirador 1 venceu"
			Global.perdedor = "Atirador 2 perdeu"	
			#Global.fase = 2
			scoreAtirador1 += 1			
		Global.restaurar()
		if fase == 3: 
			get_tree().change_scene("res://GameOver.tscn")
		elif fase < 3:
			get_tree().change_scene("res://Control.tscn")
