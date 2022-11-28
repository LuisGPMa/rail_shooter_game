extends Node

const VIDA_MAX = 50
var pontosAti1 = 50
var pontosAti2 = 50
var vencedor = ""
var perdedor = ""
var fase = 0
var scoreAtirador1 = 0
var scoreAtirador2 = 0
var qtdCura = 20

func _ready():
	pass

func restaurar():
	pontosAti1 = VIDA_MAX
	pontosAti2 = VIDA_MAX
	
func curaJogador(um_ou_dois):
	if um_ou_dois==1:
		if pontosAti1 + qtdCura <= VIDA_MAX:
			pontosAti1 += qtdCura
		else:
			pontosAti1 = VIDA_MAX
	elif um_ou_dois==2:
		if pontosAti2 + qtdCura <= VIDA_MAX:
			pontosAti2 += qtdCura
		else:
			pontosAti2 = VIDA_MAX

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
