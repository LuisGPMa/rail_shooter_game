extends Control

onready var label = $CenterContainer/Label

func _ready():
	label.text = "Fim da fase " + str(Global.fase) + "\n" + Global.vencedor + "\n" + Global.perdedor
	


func _on_Timer_timeout():
	if Global.fase == 1:
		get_tree().change_scene("res://Cena2.tscn")
	elif Global.fase == 2:
		get_tree().change_scene("res://Cena3.tscn")
	
