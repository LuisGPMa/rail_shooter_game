extends Control

onready var atirador1 = $CenterContainer/VBoxContainer/Atirador1
onready var atirador2 = $CenterContainer/VBoxContainer/Atirador2

func verificar_resultado():
	if Global.scoreAtirador1 > Global.scoreAtirador2:
		atirador1.text = "Atirador 1 venceu"
		atirador2.text = "Atirador 2 perdeu"
	elif Global.scoreAtirador2 > Global.scoreAtirador1:
		atirador2.text = "Atirador 2 venceu"
		atirador1.text = "Atirador 1 perdeu"
		
func _ready():
	verificar_resultado()
			
func _on_TryAgain_pressed():
	get_tree().change_scene("res://Main.tscn")

