extends Node2D

var total : float = 0
const SPEED : int = 100

func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		print("Right arrow")

