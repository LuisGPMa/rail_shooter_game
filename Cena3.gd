extends Node2D

var total : float = 0
const SPEED : int = 100
onready var animation = $AnimationPlayer

func _ready() -> void:
	Global.fase = 3
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		print("Right arrow")

func _process(delta):
	if Global.pontosAti1 == 0 or Global.pontosAti2 == 0:
		Global.desabilitarMira()
		animation.play("Transição")
		yield(animation, "animation_finished")
		Global.trocarDeCena()


