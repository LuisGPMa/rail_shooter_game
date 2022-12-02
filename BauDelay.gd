extends Area2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D2
onready var timer = $Timer
var segundos = 10
const Velocidade = 0.002

func _on_Bau_body_entered(body):
	print("tiro no bau")
	if body.nome == "atr1":
		self.global_position.x = 2000
		sprite.visible = false
		collision.disabled = true 
		body.queue_free()
		timer.start(segundos)
		Global.delayAtir1 = Velocidade
		yield(timer,"timeout")
		Global.delayAtir1 = 0.2
	elif body.nome == "atr2":
		self.global_position.x = 2000		
		sprite.visible = false
		collision.disabled = true 
		body.queue_free()
		timer.start(segundos)
		Global.delayAtir2 = Velocidade		
		yield(timer,"timeout")
		Global.delayAtir2 = 0.2
	
	queue_free()
